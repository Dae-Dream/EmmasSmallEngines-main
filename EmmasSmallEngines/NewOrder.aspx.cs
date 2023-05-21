using EmmasLibrary;
using EmmasLibrary.NewOrderPageDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EmmasLibrary.NewOrderPageDataSet;

namespace EmmasSmallEngines
{
	//Michael Quill
	public partial class NewOrder : System.Web.UI.Page
	{

        private static NewOrderPageDataSet dsNewOrder;
		private static OnOrderTableAdapter daOnOrder;
		private static ProdOrderTableAdapter daProdOrder;
		private static InventoryLookupTableAdapter daInventory;
		private static DataTable table;

        static NewOrder()
		{
            dsNewOrder = new NewOrderPageDataSet();
			daOnOrder = new OnOrderTableAdapter();
			daProdOrder = new ProdOrderTableAdapter();
			daInventory = new InventoryLookupTableAdapter();
			try
			{
				daInventory.Fill(dsNewOrder.InventoryLookup);
				daProdOrder.Fill(dsNewOrder.ProdOrder);
				daOnOrder.Fill(dsNewOrder.OnOrder);
			}
			catch { }
			
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			txtOrderDate.Text = DateTime.Today.ToString("d");

			if (!IsPostBack)
			{
				table = new DataTable();
				table.Columns.Add("Inventory ID");
				table.Columns.Add("Invoice #");
				table.Columns.Add("Arrive Date");
				table.Columns.Add("Quantity");
				table.Columns.Add("Price");
				gvOrder.DataSource = table;
				gvOrder.DataBind();
			}
		}

		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				string invID = Request.QueryString["invID"];
				this.txtItemID.Text = invID;

				
			}

		}


		protected void btnAddItem_Click(object sender, EventArgs e)
		{
			dvInventory.DataBind();
			string selectedID = txtItemID.Text;
			try
			{
				InventoryLookupRow row = dsNewOrder.InventoryLookup.FindByid(Convert.ToInt32(selectedID));

				if (row != null)
				{
					table.Rows.Add(row.id, txtInvoiceNumber.Text, txtArriveDate.Text, txtQuantity.Text, txtPrice.Text);
					gvOrder.DataSource = table;
					gvOrder.DataBind();
				}
			}
			catch { }
			

			
		}

		protected void btnSubmitOrder_Click(object sender, EventArgs e)
		{
			int orderID = -1;
			try
			{
				ProdOrderDataTable dtBefore = new ProdOrderDataTable();
				daProdOrder.Fill(dtBefore);
				List<int> before = new List<int>();
				foreach (ProdOrderRow row in dtBefore)
				{
					before.Add(row.id);
				}

				daProdOrder.Insert(txtOrderNumber.Text, DateTime.Parse(txtOrderDate.Text), chkPaid.Checked);

				daProdOrder.Update(dsNewOrder.ProdOrder);
				dsNewOrder.AcceptChanges();

				ProdOrderDataTable dtAfter = new ProdOrderDataTable();
				daProdOrder.Fill(dtAfter);
				List<int> after = new List<int>();
				foreach (ProdOrderRow row in dtAfter)
				{
					after.Add(row.id);
				}

				List<int> diff = new List<int>(after.Except(before).ToList());

				if (diff.Count == 1)
				{
					orderID = diff[0];
				}

				if (orderID != -1)
				{
					foreach (DataRow row in table.Rows)
					{
						//table.Columns.Add("Inventory ID");
						//table.Columns.Add("Invoice #");
						//table.Columns.Add("Arrive Date");
						//table.Columns.Add("Quantity");
						//table.Columns.Add("Price");

						int invID = Convert.ToInt32(row.ItemArray[0].ToString());
						DateTime arriveDate = DateTime.Parse(row.ItemArray[2].ToString());
						decimal price = Decimal.Parse(row.ItemArray[4].ToString(), System.Globalization.NumberStyles.Currency);
						int quant = Convert.ToInt32(row.ItemArray[3].ToString());
						
						daOnOrder.Insert(row.ItemArray[1].ToString(), arriveDate, quant, price, invID, orderID);
					}
					daOnOrder.Update(dsNewOrder.OnOrder);
					dsNewOrder.AcceptChanges();
					Response.Redirect("~/OrderSummary.aspx?orderID=" + orderID.ToString());
				}





			}
			catch
			{
				
			}
		}

		protected void btnCancelOrder_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/NewOrder.aspx");
		}

		private InventoryLookupRow SearchItemID(int id)
		{
			try
			{
				InventoryLookupRow row = dsNewOrder.InventoryLookup.FindByid(id);
				return row;
			}
			catch
			{
				return null;
			}

		}

		protected void valItemIDCustom_ServerValidate(object source, ServerValidateEventArgs args)
		{

			InventoryLookupRow row = SearchItemID(Convert.ToInt32(args.Value));
			if (row == null)
			{
				args.IsValid = false;
			}
			else
			{
				args.IsValid = true;
			}
		}
	}
}