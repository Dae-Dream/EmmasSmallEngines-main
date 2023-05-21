using EmmasLibrary;
using EmmasLibrary.CustomerPageDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EmmasLibrary.CustomerPageDataSet;

namespace EmmasSmallEngines
{
	//Michael Quill, Stephen Bodner
	public partial class Customers : Page
	{
		private static CustomerPageDataSet dsCustomers;

		private static CustomerTableAdapter daCustomer;

		private static DataRow[] rows;


		private static int id = -1;

		static Customers()
		{
			dsCustomers = new CustomerPageDataSet();
			daCustomer = new CustomerTableAdapter();
			try
			{
				daCustomer.Fill(dsCustomers.Customer);
			}
			catch { }
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				daCustomer.Fill(dsCustomers.Customer);
			}
			catch { }

			if (!IsPostBack)
			{
				btnEdit.Enabled = false;
				btnSale.Enabled = false;
				btnRepair.Enabled = false;
				btnEquip.Enabled = false;
				btnInvoices.Enabled = false;

				btnEdit.CssClass = btnEdit.CssClass.Replace("btn-primary", "btn-secondary");
				btnSale.CssClass = btnSale.CssClass.Replace("btn-primary", "btn-secondary");
				btnRepair.CssClass = btnRepair.CssClass.Replace("btn-primary", "btn-secondary");
				btnEquip.CssClass = btnEquip.CssClass.Replace("btn-primary", "btn-secondary");
				btnInvoices.CssClass = btnInvoices.CssClass.Replace("btn-primary", "btn-secondary");

				divOrderTable.Visible = false;
			}

		}

		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			if(!IsPostBack)
			{
				btnSearch_Click(sender, e);
			}
			
		}
		protected void btnSave_Click(object sender, EventArgs e)
		{
			



			if (id != -1)
			{

				//Customer Table Fields
				//[0] id
				//[1] custFirst
				//[2] custLast
				//[3] custPhone
				//[4] custAddress
				//[5] custCity
				//[6] custPostal
				//[7] custEmail
				//[8] custFullName

				DataRow customer = dsCustomers.Customer.FindByid(id);
				customer[1] = this.txtFirstName.Text;
				customer[2] = this.txtLastName.Text;
				customer[3] = this.txtPhone.Text;
				customer[4] = this.txtAddress.Text;
				customer[5] = this.txtCity.Text;
				customer[6] = this.txtPostal.Text;
				customer[7] = this.txtEmail.Text;

				//save back to the database
				try
				{
					daCustomer.Update(customer);
					daCustomer.Fill(dsCustomers.Customer);
					dsCustomers.AcceptChanges();
					btnSearch_Click(sender, e); //update names in list
					listCustomers.SelectedValue = id.ToString();
					//lblSave.Text = "Record Successfully Updated";
				}
				catch
				{
					//lblSave.Text = "Unable to Update Record"; 
				}

			}

			txtFirstName.Enabled = false;
			txtLastName.Enabled = false;
			txtPostal.Enabled = false;
			txtAddress.Enabled = false;
			txtCity.Enabled = false;
			txtEmail.Enabled = false;
			txtPhone.Enabled = false;
			btnEdit.Visible = true;
			btnSave.Visible = false;

		}

		protected void btnEdit_Click(object sender, EventArgs e)
		{
			txtFirstName.Enabled = true;
			txtLastName.Enabled = true;
			txtPostal.Enabled = true;
			txtAddress.Enabled = true;
			txtCity.Enabled = true;
			txtEmail.Enabled = true;
			txtPhone.Enabled = true;
			btnSave.Visible = true;
			btnEdit.Visible = false;
		}
		protected void btnInvoices_Click(object sender, EventArgs e)
		{
			divOrderTable.Visible = true;
		}
		protected void btnEquip_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Equipment.aspx?custID=" + id.ToString());
		}

		protected void btnSale_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Sales.aspx?custID=" + id.ToString());
		}

		protected void btnRepair_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Repairs.aspx?custID=" + id.ToString());
		}
		protected void btnSearch_Click(object sender, EventArgs e)
		{
			if (dsCustomers.Customer.Count > 0)
			{
				string criteria = GetCustomerCriteria();
				rows = (criteria.Length > 0) ? dsCustomers.Customer.Select(criteria) : dsCustomers.Customer.Select();
				DisplayCustomers();
			}
		}



		private string GetCustomerCriteria()
		{
			string criteria = "";
			criteria = (this.txtNameSearch.Text.Length > 0) ? "custFullName Like '*" + this.txtNameSearch.Text + "*'" : "";
			criteria += (this.txtPhoneSearch.Text.Length > 0 && criteria.Length > 0) ? "And custPhone Like '*" + this.txtPhoneSearch.Text + "*'"
				: (this.txtPhoneSearch.Text.Length > 0) ? "custPhone Like '*" + this.txtPhoneSearch.Text + "*'" : "";
			criteria += (this.txtEmailSearch.Text.Length > 0 && criteria.Length > 0) ? "And custEmail Like '*" + this.txtEmailSearch.Text + "*'"
				: (this.txtEmailSearch.Text.Length > 0) ? "custEmail Like '*" + this.txtEmailSearch.Text + "*'" : "";
			return criteria;
		}



		private void DisplayCustomers()
		{
			this.listCustomers.Items.Clear();
			foreach (DataRow row in rows)
				this.listCustomers.Items.Add(new ListItem(row.ItemArray[8].ToString(), row.ItemArray[0].ToString()));
		}

		protected void listCustomers_SelectedIndexChanged(object sender, EventArgs e)
		{
			txtFirstName.Enabled = false;
			txtLastName.Enabled = false;
			txtPostal.Enabled = false;
			txtAddress.Enabled = false;
			txtCity.Enabled = false;
			txtEmail.Enabled = false;
			txtPhone.Enabled = false;
			btnEdit.Visible = true;
			btnSave.Visible = false;
			btnEdit.Enabled = false;
			btnSale.Enabled = false;
			btnRepair.Enabled = false;
			btnEquip.Enabled = false;
			btnInvoices.Enabled = false;

			if (listCustomers.SelectedIndex != -1)
			{

				btnEdit.Enabled = true;
				btnSale.Enabled = true;
				btnRepair.Enabled = true;
				btnEquip.Enabled = true;
				btnInvoices.Enabled = true;

				btnEdit.CssClass = btnEdit.CssClass.Replace("btn-secondary", "btn-primary");
				btnSale.CssClass = btnSale.CssClass.Replace("btn-secondary", "btn-primary");
				btnRepair.CssClass = btnRepair.CssClass.Replace("btn-secondary", "btn-primary");
				btnEquip.CssClass = btnEquip.CssClass.Replace("btn-secondary", "btn-primary");
				btnInvoices.CssClass = btnInvoices.CssClass.Replace("btn-secondary", "btn-primary");

				string selectedID = this.listCustomers.SelectedValue;
				try
				{
					id = Convert.ToInt32(selectedID);
				}
				catch { }

				CustomerRow row = dsCustomers.Customer.FindByid(Convert.ToInt32(selectedID));
				txtFirstName.Text = row[1].ToString();
				txtLastName.Text = row[2].ToString();
				txtEmail.Text = row[7].ToString();
				txtPhone.Text = row[3].ToString();
				txtPostal.Text = row[6].ToString();
				txtAddress.Text = row[4].ToString();
				txtCity.Text = row[5].ToString();


				//if (dsCustomers.Order.Count > 0)
				//{
				//	string criteria = GetOrdersByCustomerIDCriteria(selectedID);
				//	rows = (criteria.Length > 0) ? dsCustomers.Order.Select(criteria) : dsCustomers.Order.Select();
				//	DisplayOrdersForCustomer();
				//}
			} else
			{
				btnEdit.Enabled = false;
				btnSale.Enabled = false;
				btnRepair.Enabled = false;
				btnEquip.Enabled = false;
				btnInvoices.Enabled = false;

				btnEdit.CssClass = btnEdit.CssClass.Replace("btn-primary", "btn-secondary");
				btnSale.CssClass = btnSale.CssClass.Replace("btn-primary", "btn-secondary");
				btnRepair.CssClass = btnRepair.CssClass.Replace("btn-primary", "btn-secondary");
				btnEquip.CssClass = btnEquip.CssClass.Replace("btn-primary", "btn-secondary");
				btnInvoices.CssClass = btnInvoices.CssClass.Replace("btn-primary", "btn-secondary");
			}
		}

		protected void gvOrders_SelectedIndexChanged(object sender, EventArgs e)
		{
			Response.Redirect("Receipt.aspx?receiptID=" + gvOrders.SelectedValue);
		}
	}
}