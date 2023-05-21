using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmmasSmallEngines
{
	//Michael Quill
	public partial class SiteMaster : MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (HttpContext.Current.User.Identity.IsAuthenticated)
			{
				if(HttpContext.Current.User.Identity.Name == "admin")
				{
					AdminContent.Visible = true;
					NotAdminContent.Visible = false;
				} else
				{
					AdminContent.Visible = false;
					NotAdminContent.Visible = true;
				}
				MainContent.Visible = true;
				custLink.Visible = true;
				salesLink.Visible = true;
				repairLink.Visible = true;
				invLink.Visible = true;
				logoutLink.Visible = true;
				adminLink.Visible = true;
			}
			else
			{
				MainContent.Visible = false;
				custLink.Visible = false;
				salesLink.Visible = false;
				repairLink.Visible = false;
				invLink.Visible = false;
				logoutLink.Visible = false;
				adminLink.Visible = false;
			}
		}

		protected void btnLogout_Click(object sender, EventArgs e)
		{
			var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
			authenticationManager.SignOut();
			Response.Redirect("~/Login.aspx");
		}
	}
}