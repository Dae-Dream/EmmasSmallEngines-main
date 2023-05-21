using EmmasLibrary;
using EmmasLibrary.RepairTrackerDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EmmasLibrary.RepairTrackerDataSet;

namespace EmmasSmallEngines
{
	//Michael Quill, Stephen Bodner
	public partial class RepairTracker : System.Web.UI.Page
	{
		private static Stopwatch sw;

		private static RepairTrackerDataSet dsRepairTracker;
		private static ServiceOrderTableAdapter daServiceOrder;
		private static ServiceUpdateTableAdapter daServiceUpdate;
		private static int findId = -1;
		protected void Page_Load(object sender, EventArgs e)
		{

			if (!IsPostBack)
			{
				sw = new Stopwatch();
				daServiceOrder = new ServiceOrderTableAdapter();
				daServiceUpdate = new ServiceUpdateTableAdapter();
				dsRepairTracker = new RepairTrackerDataSet();

				try
				{
					daServiceOrder.Fill(dsRepairTracker.ServiceOrder);
					daServiceUpdate.Fill(dsRepairTracker.ServiceUpdate);
				} catch
				{

				}
				
			}

		}

		protected void btnStartTimer_Click(object sender, EventArgs e)
		{
			sw.Start();
		}

		protected void btnPauseTimer_Click(object sender, EventArgs e)
		{
			sw.Stop();
			DisplayTime();
		}

		protected void btnResetTimer_Click(object sender, EventArgs e)
		{
			sw.Reset();
			DisplayTime();
		}

		protected void Timer1_Tick(object sender, EventArgs e)
		{
			DisplayTime();
		}

		protected void btnShowTable_Click(object sender, EventArgs e)
		{
			tableContainer.Visible = true;
			btnContainer.Visible = false;
		}
		protected void btnUpdateTable_Click(object sender, EventArgs e)
		{
			try
			{
				findId = Convert.ToInt32(gvRepairs.SelectedValue);
				if (findId != -1)
				{
					ServiceUpdateRow order = dsRepairTracker.ServiceUpdate.FindByid(findId);
					order.serordDateOut = DateTime.Parse(this.txtDateOut.Text);
					order.empID = Convert.ToInt32(this.ddTech.SelectedValue);
					order.serordIssue = this.txtDescription.Text;

					daServiceUpdate.Update(order);
					daServiceOrder.Fill(dsRepairTracker.ServiceOrder);
					dsRepairTracker.AcceptChanges();
					gvRepairs_SelectedIndexChanged(sender, e);
					gvRepairs.DataBind();
				}

			}
			catch
			{

			}
		}

		private void DisplayTime()
		{
			string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}", sw.Elapsed.Hours, sw.Elapsed.Minutes, sw.Elapsed.Seconds);
			lblTimerDisplay.Text = elapsedTime;
		}

		protected void gvRepairs_SelectedIndexChanged(object sender, EventArgs e)
		{
			tableContainer.Visible = false;
			btnContainer.Visible = true;

			txtDateIn.Text = "";
			txtDateOut.Text = "";
			txtService.Text = "";
			txtServiceDesc.Text = "";
			txtEquipID.Text = "";
			txtEquipType.Text = "";
			txtEquipModel.Text = "";
			txtEquipSerial.Text = "";
			txtDescription.Text = "";

			ServiceOrderRow row = dsRepairTracker.ServiceOrder.FindByid(Convert.ToInt32(gvRepairs.SelectedRow.Cells[1].Text));
			txtDateIn.Text = row.serordDateIn.ToString("d");
			txtDateOut.Text = row.serordDateOut.ToString("d");
			txtService.Text = row.serName;
			txtServiceDesc.Text = row.serDescription;
			txtEquipID.Text = row.equipID.ToString();
			txtEquipType.Text = row.eqtType;
			txtEquipModel.Text = row.equModel;
			txtEquipSerial.Text = row.equSerial;
			ddTech.SelectedValue = row.empID.ToString();
			txtDescription.Text = row.serordIssue;

			if (row.serordWarranty == true)
			{
				btnWarrantyNo.CssClass = btnWarrantyNo.CssClass.Replace("btn-danger", "btn-secondary");
				btnWarrantyYes.CssClass = btnWarrantyYes.CssClass.Replace("btn-secondary", "btn-success");
			}
			else if (row.serordWarranty == false)
			{
				btnWarrantyNo.CssClass = btnWarrantyNo.CssClass.Replace("btn-secondary", "btn-danger");
				btnWarrantyYes.CssClass = btnWarrantyYes.CssClass.Replace("btn-success", "btn-secondary");
			}
		}
	}
}