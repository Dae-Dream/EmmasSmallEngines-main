using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmasSmallEngines
{
	//Michael Quill
	public partial class Admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnOrders_Click(object sender, EventArgs e)
		{
			if (ordersDiv.Visible == true)
			{
				ordersDiv.Visible = false;
			}
			else
			{
				ordersDiv.Visible = true;
			}

		}

		protected void btnLogout_Click(object sender, EventArgs e)
		{
			var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
			authenticationManager.SignOut();
			Response.Redirect("~/Login.aspx");
		}

		protected void btnEmployees_Click(object sender, EventArgs e)
		{
			if (employeesDiv.Visible == true)
			{
				employeesDiv.Visible = false;
			}
			else
			{
				employeesDiv.Visible = true;
			}
		}

		protected void btnSales_Click(object sender, EventArgs e)
		{
			if (salesDiv.Visible == true)
			{
				salesDiv.Visible = false;
			}
			else
			{
				salesDiv.Visible = true;
			}
		}

		protected void btnManageData_Click(object sender, EventArgs e)
		{
			if (manageDataDiv.Visible == true)
			{
				manageDataDiv.Visible = false;
			}
			else
			{
				manageDataDiv.Visible = true;
			}
		}

		protected void btnCustomer_Click(object sender, EventArgs e)
		{
			if (customerDiv.Visible == true)
			{
				customerDiv.Visible = false;
			}
			else
			{
				customerDiv.Visible = true;
			}
		}

		protected void btnReceipt_Click(object sender, EventArgs e)
		{
			if (receiptDiv.Visible == true)
			{
				receiptDiv.Visible = false;
			}
			else
			{
				receiptDiv.Visible = true;
			}
		}

		protected void btnEmployee_Click(object sender, EventArgs e)
		{
			if (employeeDiv.Visible == true)
			{
				employeeDiv.Visible = false;
			}
			else
			{
				employeeDiv.Visible = true;
			}
		}

		protected void btnLookupTables_Click(object sender, EventArgs e)
		{
			if (lookupTablesDiv.Visible == true)
			{
				lookupTablesDiv.Visible = false;
			}
			else
			{
				lookupTablesDiv.Visible = true;
			}
		}

		protected void btnInventory_Click(object sender, EventArgs e)
		{
			if (inventoryDiv.Visible == true)
			{
				inventoryDiv.Visible = false;
			}
			else
			{
				inventoryDiv.Visible = true;
			}
		}

		protected void btnProductOrder_Click(object sender, EventArgs e)
		{
			if (productOrderDiv.Visible == true)
			{
				productOrderDiv.Visible = false;
			}
			else
			{
				productOrderDiv.Visible = true;
			}
		}

		protected void btnInsertEmployee_Click(object sender, EventArgs e)
		{
			if (insertEmployeeDiv.Visible == true)
			{
				insertEmployeeDiv.Visible = false;
			}
			else
			{
				insertEmployeeDiv.Visible = true;
			}
		}

		protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e)
		{
			//dvPositions.SetPageIndex(ddlPositions.SelectedIndex);
		}

		protected void dvPositions_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
		{
			ddlPositions.DataBind();

		}

		protected void dvPositions_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
		{
			ddlPositions.DataBind();
		}

		protected void dvPositions_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
		{
			ddlPositions.DataBind();
		}

		protected void dvPayments_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
		{
			ddlPayments.DataBind();
		}

		protected void dvPayments_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
		{
			ddlPayments.DataBind();
		}

		protected void dvPayments_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
		{
			ddlPayments.DataBind();
		}

		protected void dvManufacturers_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
		{
			ddlManufacturers.DataBind();
		}

		protected void dvManufacturers_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
		{
			ddlManufacturers.DataBind();
		}

		protected void dvManufacturers_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
		{
			ddlManufacturers.DataBind();
		}

		protected void dvEquipTypes_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
		{
			ddlEquipTypes.DataBind();
		}

		protected void dvEquipTypes_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
		{
			ddlEquipTypes.DataBind();
		}

		protected void dvEquipTypes_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
		{
			ddlEquipTypes.DataBind();
		}

		protected void dvServices_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
		{
			ddlServices.DataBind();
		}

		protected void dvServices_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
		{
			ddlServices.DataBind();
		}

		protected void dvServices_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
		{
			ddlServices.DataBind();
		}

		protected void dvProducts_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
		{
			ddlProducts.DataBind();
		}

		protected void dvProducts_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
		{
			ddlProducts.DataBind();
		}

		protected void dvProducts_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
		{
			ddlProducts.DataBind();
		}
	}
}