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
	public partial class NewCustomer : System.Web.UI.Page
	{

		private static CustomerPageDataSet dsCustomers;
		private static CustomerTableAdapter daCustomer;
		
		static NewCustomer()
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

		}

		protected void btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				CustomerDataTable dtBefore = new CustomerDataTable();
				daCustomer.Fill(dtBefore);
				List<int> before = new List<int>();
				foreach (CustomerRow row in dtBefore)
				{
					before.Add(row.id);
				}
				
				daCustomer.Insert(txtFirstName.Text, txtLastName.Text, txtPhone.Text, txtAddress.Text, txtCity.Text, txtPostal.Text, txtEmail.Text);
				
				daCustomer.Update(dsCustomers.Customer);
				dsCustomers.AcceptChanges();

				CustomerDataTable dtAfter = new CustomerDataTable();
				daCustomer.Fill(dtAfter);
				List<int> after = new List<int>();
				foreach (CustomerRow row in dtAfter)
				{
					after.Add(row.id);
				}

				List<int> diff = new List<int>(after.Except(before).ToList());

				if (diff.Count == 1)
				{
					lblFirstName.Text = diff[0].ToString();
				}

			}
			catch { lblFirstName.Text = "Something happened"; }


		}
		protected void btnSaveSale_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Sales.aspx");
		}
		protected void btnSaveEquipment_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Equipment.aspx");
		}
	}
}