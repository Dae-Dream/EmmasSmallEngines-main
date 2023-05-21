<%@ Page Title="New Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewCustomer.aspx.cs" Inherits="EmmasSmallEngines.NewCustomer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%--Michael Quill--%>
	<h2 class="mt-3"><%: Title %></h2>
	<div class="card">
		<asp:ValidationSummary ID="vsNewCustomer" runat="server" />
		<div class="card-body">
			<div class="row">
				<div class="col-md-2">
					<asp:Label ID="lblFirstName" runat="server" Text="First Name" AssociatedControlID="txtFirstName" />
				</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtFirstName" runat="server" CssClass="col-12" Placeholder="John"/>
					<asp:RequiredFieldValidator ID="valFirstNameReq" runat="server" ErrorMessage="First Name is required." ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
				</div>
				<div class="col-md-2">
					<asp:Label ID="lblLastName" runat="server" Text="Last Name" AssociatedControlID="txtLastName"/>
				</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtLastName" runat="server" CssClass="col-12" Placeholder="Smith" />
					<asp:RequiredFieldValidator ID="valLastNameReq" runat="server" ErrorMessage="Last Name is required." ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-md-2">
					<asp:Label ID="lblPhone" runat="server" Text="Phone" AssociatedControlID="txtPhone" />
				</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtPhone" runat="server" CssClass="col-12" Placeholder="1234567890" />
					<asp:RequiredFieldValidator ID="valPhoneReq" runat="server" ErrorMessage="Phone # is required." ControlToValidate="txtPhone" Display="Dynamic"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="valPhoneRegex" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone # must be 10 digits, no symbols." ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
				</div>
				<div class="col-md-2">
					<asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail" />
				</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtEmail" runat="server" CssClass="col-12" Placeholder="name@email.com"/>
					<asp:RequiredFieldValidator ID="valEmailReq" runat="server" ErrorMessage="Email is required." ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="valEmailRegex" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is not valid." Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-md-2">
					<asp:Label ID="lblAddress" runat="server" Text="Address" AssociatedControlID="txtAddress" />
				</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtAddress" runat="server" CssClass="col-12" Placeholder="123 Main St"/>
					<asp:RequiredFieldValidator ID="valAddressReq" runat="server" ErrorMessage="Address is required." ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
				</div>
				<div class="col-md-2">
					<asp:Label ID="lblCity" runat="server" Text="City" AssociatedControlID="txtCity" />
				</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtCity" runat="server" CssClass="col-12" Placeholder="Toronto"/>
					<asp:RequiredFieldValidator ID="valCityReq" runat="server" ErrorMessage="City is required." ControlToValidate="txtCity" Display="Dynamic"></asp:RequiredFieldValidator>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-md-2">
					<asp:Label ID="lblPostal" runat="server" Text="Postal Code" AssociatedControlID="txtPostal" />
				</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtPostal" runat="server" CssClass="col-12" Placeholder="A1A1A1" style="text-transform:uppercase"/>
					<asp:RequiredFieldValidator ID="valPostalReq" runat="server" ErrorMessage="Postal Code is required." ControlToValidate="txtPostal" Display="Dynamic"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="valPostalRegex" runat="server" ControlToValidate="txtPostal" ErrorMessage="Postal Code is not valid." Display="Dynamic" ValidationExpression="^[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]$"></asp:RegularExpressionValidator>
					
				</div>
				<div class="col-md-5"></div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
					<asp:LinkButton ID="btnSave" OnClick="btnSave_Click" CausesValidation="true" CssClass="btn btn-primary" runat="server" Text="Save"/>
				
					<asp:LinkButton ID="btnSaveSale" OnClick="btnSaveSale_Click" CausesValidation="true" CssClass="btn btn-primary" runat="server" Text="Save and Start Sale"/>
				
					<asp:LinkButton ID="btnSaveEquipment" OnClick="btnSaveEquipment_Click" CausesValidation="true" CssClass="btn btn-primary" runat="server" Text="Save and Edit Equipment"/>
				</div>
			</div>
		</div>
	</div>
</asp:Content>