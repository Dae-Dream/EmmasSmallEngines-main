using EmmasLibrary;
using EmmasLibrary.EquipmentPageDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EmmasLibrary.EquipmentPageDataSet;

namespace EmmasSmallEngines
{
	//Michael Quill, Stephen Bodner
	public partial class Equipment : Page
	{
		private static EquipmentPageDataSet dsEquipment;

		private static equipmentTableAdapter daEquipment;

		private static customerTableAdapter daCustomer;

		private static EquipmentUpdateTableAdapter daEquipUpdate;

		private static DataRow[] rows;

		private static int findId = -1;

		static Equipment()
		{
			dsEquipment = new EquipmentPageDataSet();
			daCustomer = new customerTableAdapter();
			daEquipment = new equipmentTableAdapter();
			daEquipUpdate = new EquipmentUpdateTableAdapter();
			try
			{
				daCustomer.Fill(dsEquipment.customer);
				daEquipment.Fill(dsEquipment.equipment);
				daEquipUpdate.Fill(dsEquipment.EquipmentUpdate);
			}
			catch { }
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			btnEdit.CssClass = btnEdit.CssClass.Replace("btn-primary", "btn-secondary");
			btnEdit.Enabled = false;

			btnRepair.CssClass = btnRepair.CssClass.Replace("btn-primary", "btn-secondary");
			btnRepair.Enabled = false;
		}

		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			if(!IsPostBack)
			{
				string value = Request.QueryString["custID"];
				this.ddCustomer.SelectedValue = value;

				if (!String.IsNullOrEmpty(value) && value != "Select Customer")
				{
					if (dsEquipment.equipment.Count > 0)
					{
						string criteria = GetCustomerCriteria(value);
						rows = (criteria.Length > 0) ? dsEquipment.equipment.Select(criteria) : dsEquipment.equipment.Select();
						DisplayEquipmentList();
					}
				}
			}
			
		}


		protected void btnSaveEquip_Click(object sender, EventArgs e)
		{
			
			try
			{
				EquipmentUpdateDataTable dtbefore = new EquipmentUpdateDataTable();
				daEquipUpdate.Fill(dtbefore);
				List<int> before = new List<int>();
				foreach (EquipmentUpdateRow row in dtbefore)
				{
					before.Add(row.id);
				}

				daEquipUpdate.Insert(this.txtEquipModel.Text, this.txtEquipSerial.Text, Convert.ToInt32(this.ddCustomer.SelectedValue), Convert.ToInt32(this.ddEquipType.SelectedValue), Convert.ToInt32(this.ddEquipManu.SelectedValue));

				daEquipUpdate.Fill(dsEquipment.EquipmentUpdate);
				daEquipment.Fill(dsEquipment.equipment);
				dsEquipment.AcceptChanges();

				EquipmentUpdateDataTable dtafter = new EquipmentUpdateDataTable();
				daEquipUpdate.Fill(dtafter);
				List<int> after = new List<int>();
				foreach (EquipmentUpdateRow row in dtafter)
				{
					after.Add(row.id);
				}

				ddCustomer_SelectedIndexChanged(sender, e);
				DisplayEquipmentList();

				List<int> diff = new List<int>(after.Except(before).ToList());
				 
				if (diff.Count == 1)
				{
					int id = diff[0];
					listEquipment.SelectedValue = id.ToString();
				}
			}
			catch
			{

			}

		}
		protected void btnRepair_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Repairs.aspx?custID=" + ddCustomer.SelectedValue + "&equID=" + listEquipment.SelectedValue);
		}

		protected void btnEdit_Click(object sender, EventArgs e)
		{
			try
			{
				findId = Convert.ToInt32(listEquipment.SelectedValue);
				if (findId != -1)
				{
					EquipmentUpdateRow equipment = dsEquipment.EquipmentUpdate.FindByid(findId);
					//[0]id
					//[1]equModel
					//[2]equSerial
					//[3]custID
					//[4]equtypeID
					//[5]equManuID
					equipment.equModel = this.txtEquipModel.Text;
					equipment.equSerial = this.txtEquipSerial.Text;
					equipment.custID = Convert.ToInt32(this.ddCustomer.SelectedValue);
					equipment.equtypeID = Convert.ToInt32(this.ddEquipType.SelectedValue);
					equipment.equManuID = Convert.ToInt32(this.ddEquipManu.SelectedValue);

					daEquipUpdate.Update(equipment);
					daEquipment.Fill(dsEquipment.equipment);
					dsEquipment.AcceptChanges();
					ddCustomer_SelectedIndexChanged(sender, e);
					DisplayEquipmentList();

					//lblStatus.Text = "Successful Update";
				}

			}
			catch
			{

			}
		}
		protected void btnDelete_Click(object sender, EventArgs e)
		{
			try
			{
				findId = Convert.ToInt32(listEquipment.SelectedValue);
				if (findId != -1)
				{
					EquipmentUpdateRow equipment = dsEquipment.EquipmentUpdate.FindByid(findId);
					int id = equipment.id;
					string equModel = equipment.equModel;
					string equSerial = equipment.equSerial;
					int custID = equipment.custID;
					int equtypeID = equipment.equtypeID;
					int equManuID = equipment.equManuID;
					daEquipUpdate.Delete(id, equModel, equSerial, custID, equtypeID, equManuID);
					daEquipment.Fill(dsEquipment.equipment);
					dsEquipment.AcceptChanges();
					ddCustomer_SelectedIndexChanged(sender, e);
					DisplayEquipmentList();
				}
			}
			catch
			{

			}
		}
		protected void btnGoToCustomer_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Customers.aspx");
		}

		protected void listEquipment_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (listEquipment.SelectedIndex == -1)
			{
				btnEdit.Enabled = false;
				btnEdit.CssClass = btnEdit.CssClass.Replace("btn-primary", "btn-secondary");

				btnRepair.Enabled = false;
				btnRepair.CssClass = btnRepair.CssClass.Replace("btn-primary", "btn-secondary");
			} else
			{
				btnEdit.Enabled = true;
				btnEdit.CssClass = btnEdit.CssClass.Replace("btn-secondary", "btn-primary");

				btnRepair.Enabled = true;
				btnRepair.CssClass = btnRepair.CssClass.Replace("btn-secondary", "btn-primary");
			}
			string selectedID = this.listEquipment.SelectedValue;
			equipmentRow row = dsEquipment.equipment.FindByid(Convert.ToInt32(selectedID));
			txtEquipModel.Text = row[1].ToString();
			txtEquipSerial.Text = row[2].ToString();
			ddEquipType.Text = row[4].ToString();
			ddEquipManu.Text = row[5].ToString();
		}

		private string GetCustomerCriteria(string id)
		{
			string criteria = "";
			criteria = (this.ddCustomer.Text !="None") ? "custID = " + id : "";
			return criteria;
		}

		private void DisplayEquipmentList()
		{
			this.listEquipment.Items.Clear();
			foreach (DataRow row in rows)
				this.listEquipment.Items.Add(new ListItem(row.ItemArray[7].ToString() + ": " + row.ItemArray[6].ToString(),row.ItemArray[0].ToString()));
		}

		protected void ddCustomer_SelectedIndexChanged(object sender, EventArgs e)
		{
			txtEquipModel.Text = "";
			txtEquipSerial.Text = "";
			ddEquipManu.SelectedIndex = 0;
			ddEquipType.SelectedIndex = 0;
			listEquipment.Items.Clear();

			string value = ddCustomer.SelectedValue;
			if(!String.IsNullOrEmpty(value) && value != "Select Customer")
			{
				if (dsEquipment.equipment.Count > 0)
				{
					string criteria = GetCustomerCriteria(value);
					rows = (criteria.Length > 0) ? dsEquipment.equipment.Select(criteria) : dsEquipment.equipment.Select();
					DisplayEquipmentList();
				}
			}
			
		}
	}
}