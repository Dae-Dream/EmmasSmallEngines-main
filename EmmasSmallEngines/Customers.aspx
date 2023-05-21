<%@ Page Title="Customers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="EmmasSmallEngines.Customers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%--Michael Quill, Stephen Bodner, Sam Warkentin--%>
	<div class="container">

		<div class="row">
			<div class="col-2">
				<h2 class="mt-3"><%: Title %></h2>
			</div>
			<div class="col-3">
				<asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/NewCustomer.aspx" CssClass="mt-3 btn btn-primary">New Customer</asp:LinkButton>
			</div>
		</div>
		<div class="row">
			<div class="col-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Search for Customer</h5>
						<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
							<asp:Label ID="lblNameSearch" runat="server" Text="Name" AssociatedControlID="txtNameSearch" />
							<br />
							<asp:TextBox ID="txtNameSearch" runat="server" />
							<br />
							<asp:Label ID="lblPhoneSearch" runat="server" Text="Phone" AssociatedControlID="txtPhoneSearch" />
							<br />
							<asp:TextBox ID="txtPhoneSearch" runat="server" TextMode="Phone" ToolTip="1113334444" />
							<br />
							<asp:Label ID="lblEmailSearch" runat="server" Text="Email" AssociatedControlID="txtEmailSearch" />
							<br />
							<asp:TextBox ID="txtEmailSearch" runat="server" TextMode="Email" />
							<br />
							<asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="mt-3 btn btn-primary" CausesValidation="False">Search</asp:LinkButton>
							<div class="form-group mt-3">
								<asp:ListBox ID="listCustomers" runat="server" CssClass="form-control"
									SelectionMode="Single" AutoPostBack="True" OnSelectedIndexChanged="listCustomers_SelectedIndexChanged"></asp:ListBox>
							</div>
						</asp:Panel>
					</div>
				</div>

			</div>
			<div class="col-8">
				<div class="row">
					<div class="card col-12">
						<div class="card-body">
							<div class="row">
								<div class="col-auto">
									<h5 class="card-title">Customer Info</h5>
								</div>
								<div class="col-2">
									<asp:LinkButton ID="btnEdit" OnClick="btnEdit_Click" CausesValidation="false" CssClass="btn btn-primary" runat="server" Text="Edit" />
									<asp:LinkButton ID="btnSave" OnClick="btnSave_Click" CausesValidation="true" CssClass="btn btn-primary" runat="server" Text="Save" Visible="false"/>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-2">
									<asp:Label ID="lblFirstName" runat="server" Text="First Name" AssociatedControlID="txtFirstName" />
									</div>
								<div class="col-4">
									<asp:TextBox ID="txtFirstName" runat="server" Enabled="false" />
									<asp:RequiredFieldValidator ID="valFirstNameReq" runat="server" ForeColor="red" ErrorMessage="First Name is required." ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
								</div>
								<div class="col-2">
									<asp:Label ID="lblLastName" runat="server" Text="Last Name" AssociatedControlID="txtLastName" />
								</div>
								<div class="col-4">
									<asp:TextBox ID="txtLastName" runat="server" Enabled="false" />
									<asp:RequiredFieldValidator ID="valLastNameReq" runat="server" ForeColor="red" ErrorMessage="Last Name is required." ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator>
								</div>
	</div>
	<div class="row mt-3">
								<div class="col-2">
									<asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail" />
								</div>
								<div class="col-4">
									<asp:TextBox ID="txtEmail" runat="server" Enabled="false" />
									<asp:RequiredFieldValidator ID="valEmailReq" runat="server" ForeColor="red" ErrorMessage="Email is required." ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="valEmailRegex" runat="server" ForeColor="red" ControlToValidate="txtEmail" ErrorMessage="Email is not valid." Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
								</div>
								<div class="col-2">
									<asp:Label ID="lblPhone" runat="server" Text="Phone" AssociatedControlID="txtPhone" />
								</div>
								<div class="col-4">
									<asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Enabled="false" />
									<asp:RequiredFieldValidator ID="valPhoneReq" runat="server" ForeColor="red" ErrorMessage="Phone # is required." ControlToValidate="txtPhone" Display="Dynamic"></asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="valPhoneRegex" runat="server" ForeColor="red" ControlToValidate="txtPhone" ErrorMessage="Phone # must be 10 digits, no symbols." ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-2">
									<asp:Label ID="lblAddress" runat="server" Text="Address" AssociatedControlID="txtAddress" />
								</div>
								<div class="col-4">
									<asp:TextBox ID="txtAddress" runat="server" Enabled="false" />
									<asp:RequiredFieldValidator ID="valAddressReq" runat="server" ForeColor="red" ErrorMessage="Address is required." ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
								</div>
								<div class="col-2">
									<asp:Label ID="lblCity" runat="server" Text="City" AssociatedControlID="txtCity" />
								</div>
								<div class="col-4">
									<asp:TextBox ID="txtCity" runat="server" Enabled="false" />
									<asp:RequiredFieldValidator ID="valCityReq" runat="server" ForeColor="red" ErrorMessage="City is required." ControlToValidate="txtCity" Display="Dynamic"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-2">
									<asp:Label ID="lblPostal" runat="server" Text="Postal Code" AssociatedControlID="txtPostal" />
								</div>
								<div class="col-4">
									<asp:TextBox ID="txtPostal" runat="server" Enabled="false" />
									<asp:RequiredFieldValidator ID="valPostalReq" runat="server" ForeColor="red" ErrorMessage="Postal Code is required." ControlToValidate="txtPostal" Display="Dynamic"></asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="valPostalRegex" runat="server" ForeColor="red" ControlToValidate="txtPostal" ErrorMessage="Postal Code is not valid." Display="Dynamic" ValidationExpression="^[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]$"></asp:RegularExpressionValidator>
								</div>
							</div>
							<div class="row mt-3 justify-content-between">
								<div class="col-auto">
									<asp:LinkButton ID="btnSale" OnClick="btnSale_Click" CausesValidation="False" CssClass="btn btn-primary" runat="server" Text="Start Sale" />
									<asp:LinkButton ID="btnRepair" OnClick="btnRepair_Click" CausesValidation="False" CssClass="btn btn-primary" runat="server" Text="Start Repair" />

								</div>
								<div class="col-auto">
									<asp:LinkButton ID="btnEquip" OnClick="btnEquip_Click" CausesValidation="False" CssClass="btn btn-primary" runat="server" Text="Equipment" />
									<asp:LinkButton ID="btnInvoices" OnClick="btnInvoices_Click" CausesValidation="False" CssClass="btn btn-primary" runat="server" Text="Invoices" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div id="divOrderTable" class="card col-12" runat="server">
						<div class="card-body">
							<div class="row">
								<div class="col-auto">
									<h5 class="card-title">Customer Orders</h5>
								</div>
							</div>
							<div class="row justify-content-center">
								<asp:GridView ID="gvOrders" runat="server" OnSelectedIndexChanged="gvOrders_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsOrders" BorderStyle="Solid" BorderWidth="2px" CssClass="table table-striped col-12" AutoGenerateSelectButton="True">
									<Columns>
										<asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
										<asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
										<asp:BoundField DataField="ordDate" DataFormatString="{0:d}" HeaderText="Date" SortExpression="ordDate" />
										<asp:BoundField DataField="empFullName" HeaderText="Employee" ReadOnly="True" SortExpression="empFullName" />
										<asp:BoundField DataField="payType" HeaderText="Payment" ReadOnly="True" SortExpression="payType" />
										<asp:BoundField DataField="orderTotal" DataFormatString="{0:c}" HeaderText="Order Total" ReadOnly="True" SortExpression="orderTotal" />
										<asp:BoundField DataField="serviceTotal" DataFormatString="{0:c}" HeaderText="Service Total" ReadOnly="True" SortExpression="serviceTotal" />
									</Columns>
								</asp:GridView>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<asp:ObjectDataSource ID="odsOrders" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.CustomerPageDataSetTableAdapters.OrderTableAdapter">
		<SelectParameters>
			<asp:ControlParameter ControlID="listCustomers" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>
