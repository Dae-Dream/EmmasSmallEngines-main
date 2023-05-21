<%@ Page Title= "Login"Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EmmasSmallEngines.Login" %>

<%--Michael Quill--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="LoginContent" runat="server">
	<asp:Panel ID="loginPanel" runat="server" DefaultButton="btnLogin">
			<div class="row mt-5 justify-content-center">
				<div class="col-6">
					<div class="card">
						<div class="card-body">
							<div class="row justify-content-center">
								<h2 class="card-title">Login</h2>
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
							<div class="row justify-content-center">
								<asp:RequiredFieldValidator ID="reqUser" runat="server" ErrorMessage="* Username is required." ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
							</div>
							<div class="row justify-content-center">
								<asp:RequiredFieldValidator ID="reqPass" runat="server" ErrorMessage="* Password is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
							</div>
							<div class="row justify-content-center">
								<asp:Label ID="lblMessage" runat="server" Text="" />
							</div>
							<hr />
							<div class="row justify-content-center">
								<div class="col-2">
									<asp:LinkButton ID="btnLogin" runat="server" CausesValidation="true" CssClass="btn btn-primary" OnClick="btnLogin_Click">Login</asp:LinkButton>
								</div>
								<div class="col-2">
									<asp:LinkButton ID="btnRegister" runat="server" CausesValidation="false" CssClass="btn btn-primary" OnClick="btnRegister_Click">Register</asp:LinkButton>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</asp:Panel>
</asp:Content>

