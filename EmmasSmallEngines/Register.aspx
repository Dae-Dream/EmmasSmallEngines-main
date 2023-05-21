<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EmmasSmallEngines.Register" %>

<%--Michael Quill--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="LoginContent" runat="server">
	<asp:Panel ID="registerPanel" runat="server" DefaultButton="btnRegister">
		<div class="row mt-5 justify-content-center">
			<div class="col-6">
				<div class="card">
					<div class="card-body">
						<div class="row justify-content-center">
							<h2 class="card-title">Register New User</h2>
						</div>
						<hr />
						<div class="row justify-content-center">
							<div class="col-4">
								<asp:Label ID="lblUserName" runat="server" Text="Username" AssociatedControlID="txtUsername" CssClass="float-right" />
							</div>
							<div class="col-6">
								<asp:TextBox ID="txtUsername" OnLoad="txtUsername_Load" runat="server" CssClass="col-12" />
							</div>
						</div>
						<div class="row mt-4 justify-content-center">
							<div class="col-4">
								<asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword" CssClass="float-right" />
							</div>
							<div class="col-6">
								<asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="col-12" />
							</div>
						</div>
						<div class="row mt-1 justify-content-center">
							<div class="col-4">
								<asp:Label ID="lblConfirm" runat="server" Text="Confirm Password" AssociatedControlID="txtConfirm" CssClass="float-right" />
							</div>
							<div class="col-6">
								<asp:TextBox ID="txtConfirm" TextMode="Password" runat="server" CssClass="col-12" />
							</div>
						</div>
						<div class="row justify-content-center">
							<asp:CompareValidator ID="cvPasswords" runat="server" ErrorMessage="* Passwords don't match." ControlToCompare="txtConfirm" ControlToValidate="txtPassword" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
						</div>
						<div class="row justify-content-center">
							<asp:Label ID="lblMessage" runat="server" Text="" />
						</div>
						<hr />
						<div class="row justify-content-center">
							<asp:LinkButton ID="btnRegister" runat="server" CssClass="btn btn-primary" OnClick="btnRegister_Click">Register</asp:LinkButton>
						</div>
					</div>
				</div>
			</div>

		</div>
	</asp:Panel>
</asp:Content>
