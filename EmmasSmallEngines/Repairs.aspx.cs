using EmmasLibrary;
using EmmasLibrary.RepairsPageDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EmmasLibrary.RepairsPageDataSet;

namespace EmmasSmallEngines
{
	//Michael Quill, Stephen Bodner
	public partial class Repairs : Page
	{
		private static RepairsPageDataSet dsRepairs;
		private static CustomerTableAdapter daCustomer;
		private static EquipmentDetailsTableAdapter daEquipmentDetails;
		private static ReceiptTableAdapter daReceipt;
		private static ServiceTableAdapter daServices;
		private static ServiceOrderTableAdapter daServiceOrder;


		private static DataTable services;
		private static DataTable table;

		static Repairs()
		{
			daServices = new ServiceTableAdapter();
			dsRepairs = new RepairsPageDataSet();
			daCustomer = new CustomerTableAdapter();
			daEquipmentDetails = new EquipmentDetailsTableAdapter();
			daReceipt = new ReceiptTableAdapter();
			daServiceOrder = new ServiceOrderTableAdapter();
			try
			{
				daCustomer.Fill(dsRepairs.Customer);
				daEquipmentDetails.Fill(dsRepairs.EquipmentDetails);
				daReceipt.Fill(dsRepairs.Receipt);
				daServices.Fill(dsRepairs.Service);
				daServiceOrder.Fill(dsRepairs.ServiceOrder);
			}
			catch { }
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				



				txtDateIn.Text = DateTime.Today.ToString("d");
				services = new DataTable();

				services.Columns.Add("DateIn", typeof(DateTime));
				services.Columns.Add("DateOut", typeof(DateTime));
				services.Columns.Add("Notes", typeof(string));
				services.Columns.Add("Service ID", typeof(int));
				services.Columns.Add("Equipment ID", typeof(int));
				services.Columns.Add("Employee ID", typeof(int));
				services.Columns.Add("Warranty", typeof(bool));

				table = new DataTable();
				table.Columns.Add("Service");
				table.Columns.Add("Equipment ID");
				table.Columns.Add("Price");
				table.Columns.Add("Warranty", typeof(bool));
				gvServices.DataSource = table;
				gvServices.DataBind();
			}
		}

		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			if(!IsPostBack)
			{
				string custID = Request.QueryString["custID"];
				string equipID = Request.QueryString["equID"];
				if (!String.IsNullOrEmpty(custID) && custID != "-1")
				{
					this.ddCustomers.SelectedValue = custID;

					ddEquipment.Items.Clear();
					ddEquipment.Items.Add(new ListItem("Select Equipment", "-1"));
					foreach(EquipmentDetailsRow row in daEquipmentDetails.GetData().Rows)
					{
						if(row.custID.ToString() == custID)
						{
							ddEquipment.Items.Add(new ListItem(row.manName + " " + row.eqtType, row.id.ToString()));
						}
						
					}
					if (!String.IsNullOrEmpty(equipID) && equipID != "-1")
					{
						ddEquipment.SelectedValue = equipID;

						try
						{
							int id = Convert.ToInt32(equipID);
							EquipmentDetailsRow equip = dsRepairs.EquipmentDetails.FindByid(id);

							txtModel.Text = equip.equModel;
							txtSerial.Text = equip.equSerial;
						}
						catch { }

					}

					} else
				{
					ddEquipment.Items.Clear();
					ddEquipment.Items.Add(new ListItem("Select Equipment", "-1"));
				}

				try
				{
					int value = Convert.ToInt32(custID);
					if (value > 0)
					{
						CustomerRow row = dsRepairs.Customer.FindByid(value);
						txtPhone.Text = row.custPhone;
						txtAddress.Text = row.custAddress;
						txtCity.Text = row.custCity;
						txtPostalCode.Text = row.custPostal;
						txtEmail.Text = row.custEmail;

					}
				}
				catch { }


			}

			
		}

		protected void btnWarrantyNo_Click(object sender, EventArgs e)
		{
			btnWarrantyNo.CssClass = btnWarrantyNo.CssClass.Replace("btn-secondary", "btn-danger");
			btnWarrantyYes.CssClass = btnWarrantyYes.CssClass.Replace("btn-success", "btn-secondary");
		}

		protected void btnWarrantyYes_Click(object sender, EventArgs e)
		{
			btnWarrantyNo.CssClass = btnWarrantyNo.CssClass.Replace("btn-danger", "btn-secondary");
			btnWarrantyYes.CssClass = btnWarrantyYes.CssClass.Replace("btn-secondary", "btn-success");
		}

		protected void btnNewService_Click(object sender, EventArgs e)
		{
			try
			{
				ServiceDataTable dtbefore = new ServiceDataTable();
				daServices.Fill(dtbefore);
				List<int> before = new List<int>();
				foreach (ServiceRow row in dtbefore)
				{
					before.Add(row.id);
				}

				decimal serPrice = Decimal.Parse(txtNewServicePrice.Text);

				daServices.Insert(this.txtNewService.Text, this.txtNewServiceDesc.Text, serPrice);

				daServices.Fill(dsRepairs.Service);
				dsRepairs.AcceptChanges();
				ddServices.Items.Clear();

				ServiceDataTable dtafter = new ServiceDataTable();
				daServices.Fill(dtafter);
				List<int> after = new List<int>();
				foreach (ServiceRow row in dtafter)
				{
					after.Add(row.id);
				}

				ddServices.DataBind();

				List<int> diff = new List<int>(after.Except(before).ToList());

				if (diff.Count == 1)
				{
					int id = diff[0];
					ddServices.SelectedValue = id.ToString();
					
				}


			}
			catch
			{

			}
		}

		protected void btnNewEquipment_Click(object sender, EventArgs e)
		{
			if (ddCustomers.SelectedValue != "-1")
			{
				Response.Redirect("~/Equipment.aspx?custID=" + ddCustomers.SelectedValue);
			}
			else
			{
				Response.Redirect("~/Equipment.aspx");
			}

		}

		protected void btnCancelReport_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Repairs.aspx");
		}



		protected void ddCustomers_SelectedIndexChanged(object sender, EventArgs e)
		{
			txtPhone.Text = "";
			txtAddress.Text = "";
			txtCity.Text = "";
			txtPostalCode.Text = "";
			txtEmail.Text = "";
			txtModel.Text = "";
			txtSerial.Text = "";
			ddEquipment.Items.Clear();
			ddEquipment.Items.Add(new ListItem("Select Equipment", "-1"));
			foreach (EquipmentDetailsRow row in daEquipmentDetails.GetData().Rows)
			{
				if (row.custID.ToString() == ddCustomers.SelectedValue)
				{
					ddEquipment.Items.Add(new ListItem(row.manName + " " + row.eqtType, row.id.ToString()));
				}
			}
			services.Rows.Clear();
			table.Rows.Clear();
			gvServices.DataBind();

			btnWarrantyNo_Click(sender, e);
			try
			{
				int value = Convert.ToInt32(ddCustomers.SelectedValue);
				if (value != -1)
				{
					CustomerRow row = dsRepairs.Customer.FindByid(value);
					txtPhone.Text = row.custPhone;
					txtAddress.Text = row.custAddress;
					txtCity.Text = row.custCity;
					txtPostalCode.Text = row.custPostal;
					txtEmail.Text = row.custEmail;

				}
			}
			catch { }

		}

		protected void ddEquipment_SelectedIndexChanged(object sender, EventArgs e)
		{
			txtModel.Text = "";
			txtSerial.Text = "";

			btnWarrantyNo_Click(sender, e);

			if (ddEquipment.SelectedValue != "-1")
			{
				try
				{
					int id = Convert.ToInt32(ddEquipment.SelectedValue);
					EquipmentDetailsRow equip = dsRepairs.EquipmentDetails.FindByid(id);

					txtModel.Text = equip.equModel;
					txtSerial.Text = equip.equSerial;
				}
				catch { }

			}


		}

		protected void btnAddItem_Click(object sender, EventArgs e)
		{
			try
			{
				DataRow row = services.NewRow();
				row[0] = DateTime.Parse(txtDateIn.Text);
				row[1] = DateTime.Parse(txtDateOut.Text);
				row[2] = txtNotes.Text;
				row[3] = Convert.ToInt32(ddServices.SelectedValue);
				row[4] = Convert.ToInt32(ddEquipment.SelectedValue);
				row[5] = Convert.ToInt32(ddEmployee.SelectedValue);
				row[6] = btnWarrantyYes.CssClass.Contains("btn-success");

				services.Rows.Add(row);

				DisplayServices();

			}
			catch
			{

			}




		}

		private void DisplayServices()
		{
			table.Clear();


			foreach (DataRow row in services.Rows)
			{
				//Service
				//Equipment ID
				//Price
				//Warranty
				string val = ((Object)row.ItemArray[3]).ToString();
				ServiceRow service = dsRepairs.Service.FindByid(Convert.ToInt32(val));
				table.Rows.Add(service.serName, row.ItemArray[4].ToString(), service.serPrice.ToString("c"), row.ItemArray[6].ToString());

			}

			gvServices.DataSource = table;
			gvServices.DataBind();
		}

		protected void btnSubmitReport_Click(object sender, EventArgs e)
		{
			int receiptID = -1;
			try
			{
				ReceiptDataTable dtBefore = new ReceiptDataTable();
				daReceipt.Fill(dtBefore);
				List<int> before = new List<int>();
				foreach (ReceiptRow row in dtBefore)
				{
					before.Add(row.id);
				}

				daReceipt.Insert(txtOrderNumber.Text, DateTime.Now, chkPay.Checked, Convert.ToInt32(ddPayment.SelectedValue), Convert.ToInt32(ddCustomers.SelectedValue), Convert.ToInt32(ddEmployee.SelectedValue));

				daReceipt.Update(dsRepairs.Receipt);
				dsRepairs.AcceptChanges();

				ReceiptDataTable dtAfter = new ReceiptDataTable();
				daReceipt.Fill(dtAfter);
				List<int> after = new List<int>();
				foreach (ReceiptRow row in dtAfter)
				{
					after.Add(row.id);
				}

				List<int> diff = new List<int>(after.Except(before).ToList());

				if (diff.Count == 1)
				{
					receiptID = diff[0];
				}

				if (receiptID != -1)
				{
					foreach (DataRow row in services.Rows)
					{
						//0 DateIn DateTime
						//1 DateOut DateTime
						//2 Notes string
						//3 Service ID int
						//4 Equipment ID int
						//5 Employee ID int
						//6 Warranty bool

						daServiceOrder.Insert(DateTime.Parse(row.ItemArray[0].ToString()), DateTime.Parse(row.ItemArray[1].ToString()), row.ItemArray[2].ToString(), (bool)row.ItemArray[6], receiptID, Convert.ToInt32(row.ItemArray[3]), Convert.ToInt32(row.ItemArray[4]), Convert.ToInt32(row.ItemArray[5]));
					}
					daServiceOrder.Update(dsRepairs.ServiceOrder);
					dsRepairs.AcceptChanges();
					Response.Redirect("Receipt.aspx?receiptID=" + receiptID.ToString());
				}





			}
			catch
			{
				//lblFirstName.Text = "Something happened";
			}




		}

		protected void gvServices_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			services.Rows.RemoveAt(e.RowIndex);

			DisplayServices();

		}
	}

}