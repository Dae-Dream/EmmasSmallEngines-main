using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmasSmallEngines
{
	//Michael Quill
	public partial class Inventory : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void gvInventory_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.inventoryTable.Visible = false;
			this.inventoryDetails.Visible = true;
		}

		protected void btnNewOrder_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/NewOrder.aspx?invID=" + gvInventory.SelectedRow.Cells[1].Text);
		}

		protected void btnReturn_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Inventory.aspx");
		}
	}
}