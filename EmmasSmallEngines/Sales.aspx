<%@ Page Title="Sales" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="EmmasSmallEngines.Sales" %>

<%--Michael Quill, Stephen Bodner, Sam Warkentin--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<h2 class="mt-3"><%: Title %></h2>
	<div class="card">
		<div class="card-header">
			<div class="row justify-content-center">
				<div class="col-2">
					<asp:Label ID="lblEmployee" runat="server" Text="Employee" AssociatedControlID="ddEmployee" />
				</div>
				<div class="col-3">
					<asp:DropDownList ID="ddEmployee" runat="server" SelectionMode="Single" AutoPostBack="True" DataSourceID="odsEmp" DataTextField="empFullName" DataValueField="id" OnSelectedIndexChanged="ddEmployee_SelectedIndexChanged" AppendDataBoundItems="true" CssClass="col-12">
						<asp:ListItem Text="Select Employee" Value="-1" Enabled="true" />
					</asp:DropDownList>
					<asp:RequiredFieldValidator runat="server" ID="valEmployeeReq" ValidationGroup="orderGroup" ControlToValidate="ddEmployee" ErrorMessage="*" ForeColor="Red" Display="Dynamic" />
					<asp:CompareValidator runat="server" ID="valEmployeeComp" ValidationGroup="orderGroup" ControlToValidate="ddEmployee" ErrorMessage="Select an employee." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
				</div>
				<div class="col-2">
					<asp:Label ID="lblOrderNumber" runat="server" Text="Order #" AssociatedControlID="txtOrderNumber" />
				</div>
				<div class="col-3">
					<asp:TextBox ID="txtOrderNumber" TextMode="Number" runat="server" CssClass="col-12" />
					<asp:CompareValidator ID="valOrderNumberMin" runat="server" ErrorMessage="Can't be negative." ForeColor="red" ControlToValidate="txtOrderNumber" ValidationGroup="orderGroup" Operator="GreaterThan" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
					<asp:RequiredFieldValidator ID="valOrderNumberReq" runat="server" ValidationGroup="orderGroup" ForeColor="red" ErrorMessage="Order number is required." ControlToValidate="txtOrderNumber" Display="Dynamic"></asp:RequiredFieldValidator>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-2">
					<h5 class="card-title">Customer Info</h5>
				</div>
				<div class="col-3">
					<asp:DropDownList ID="ddCustomer" runat="server" SelectionMode="Single" AutoPostBack="True" DataSourceID="odsCust" DataTextField="custFullName" DataValueField="id" OnSelectedIndexChanged="ddCustomer_SelectedIndexChanged" AppendDataBoundItems="true" CssClass="col-12">
						<asp:ListItem Text="Select Customer" Value="-1" Enabled="true" />
					</asp:DropDownList>
					<asp:RequiredFieldValidator runat="server" ID="valCustomerReq" ValidationGroup="orderGroup" ControlToValidate="ddCustomer" ErrorMessage="*" ForeColor="Red" Display="Dynamic"/>
					<asp:CompareValidator runat="server" ID="valCustomerComp" ValidationGroup="orderGroup" ControlToValidate="ddCustomer" ErrorMessage="Select a customer." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
				</div>
				<div class="col-5"></div>
			</div>
			<hr />
			<div class="row justify-content-center">
				<div class="col-2">
					<asp:Label ID="lblName" runat="server" Text="Name" AssociatedControlID="txtName" />


				</div>
				<div class="col-3">
					<asp:TextBox ID="txtName" runat="server" Enabled="false" CssClass="col-12" />
				</div>
				<div class="col-2">
					<asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail" />
				</div>
				<div class="col-3">
					<asp:TextBox ID="txtEmail" runat="server" Enabled="false" CssClass="col-12" />
				</div>
			</div>
			<div class="row mt-3 justify-content-center">
				<div class="col-2">
					<asp:Label ID="lblPhone" runat="server" Text="Phone" AssociatedControlID="txtPhone" />
				</div>
				<div class="col-3">
					<asp:TextBox ID="txtPhone" runat="server" Enabled="false" CssClass="col-12" />
				</div>
				<div class="col-2">
					<asp:Label ID="lblPostalCode" runat="server" Text="Postal Code" AssociatedControlID="txtPostalCode" />
				</div>
				<div class="col-3">
					<asp:TextBox ID="txtPostalCode" runat="server" Enabled="false" CssClass="col-12" />
				</div>
			</div>
			<div class="row mt-3 justify-content-center">
				<div class="col-2">
					<asp:Label ID="lblAddress" runat="server" Text="Address" AssociatedControlID="txtAddress" />
				</div>
				<div class="col-3">
					<asp:TextBox ID="txtAddress" runat="server" Enabled="false" CssClass="col-12" />
				</div>
				<div class="col-2">
					<asp:Label ID="lblCity" runat="server" Text="City" AssociatedControlID="txtCity" />
				</div>
				<div class="col-3">
					<asp:TextBox ID="txtCity" runat="server" Enabled="false" CssClass="col-12" />
				</div>
			</div>
		</div>

	</div>
	<div class="card mt-3">
		<div class="card-body">
			<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearchItem">
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblItemID" runat="server" Text="Scan or Enter Item ID" AssociatedControlID="txtItemID" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtItemID" runat="server" CssClass="col-12" OnTextChanged="btnSearchItem_Click" />
						<asp:RequiredFieldValidator ID="valItemIDReq" ValidationGroup="itemGroup" runat="server" ForeColor="red" ErrorMessage="Item ID is required." ControlToValidate="txtItemID" Display="Dynamic"></asp:RequiredFieldValidator>
						<asp:CustomValidator ID="valItemIDCustom" runat="server" OnServerValidate="valItemIDCustom_ServerValidate" ValidationGroup="itemGroup" ForeColor="red" ErrorMessage="Item ID not found." ControlToValidate="txtItemID" Display="Dynamic"></asp:CustomValidator>
					</div>
					<div class="col-2">
						<asp:Label ID="lblQuantity" runat="server" Text="Quantity" AssociatedControlID="txtQuantity" />
						
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtQuantity" TextMode="Number" runat="server" CssClass="col-12" />
						<asp:CompareValidator ID="valQuantityMin" runat="server" ErrorMessage="Can't be negative." ForeColor="red" Display="Dynamic" ControlToValidate="txtQuantity" ValidationGroup="itemGroup" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
						<asp:RequiredFieldValidator ID="valQuantityReq" ValidationGroup="itemGroup" runat="server" ForeColor="red" ErrorMessage="Quantity is required." ControlToValidate="txtQuantity" Display="Dynamic"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="valQuantityRegex" ValidationGroup="itemGroup" runat="server" ForeColor="red" ErrorMessage="Quantity must be a whole number." ControlToValidate="txtQuantity" Display="Dynamic" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblItemName" runat="server" Text="Item Name" AssociatedControlID="txtItemName" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtItemName" runat="server" Enabled="false" CssClass="col-12" />
					</div>
					<div class="col-2">
						<asp:Label ID="lblPrice" runat="server" Text="Price" AssociatedControlID="txtPrice" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtPrice" runat="server" Enabled="false" CssClass="col-12" />
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblInStock" runat="server" Text="# in stock" AssociatedControlID="txtInStock" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtInStock" runat="server" Enabled="false" CssClass="col-7" />
						<asp:LinkButton ID="btnOrder" runat="server" CssClass="btn btn-outline-success btn-sm col-auto float-right" CausesValidation="false" OnClick="btnOrder_Click">Order</asp:LinkButton>
					</div>
					<div class="col-2">
						<asp:Label ID="lblDescription" runat="server" Text="Item Desc." AssociatedControlID="txtDescription" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtDescription" runat="server" Enabled="false" CssClass="col-12" />
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblItemSize" runat="server" Text="Size" AssociatedControlID="txtItemSize" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtItemSize" runat="server" Enabled="false" CssClass="col-12" />
					</div>
					<div class="col-2">
						<asp:Label ID="lblPayment" runat="server" Text="Payment" AssociatedControlID="ddPayment" />
					</div>
					<div class="col-3">
						<asp:DropDownList ID="ddPayment" runat="server" AppendDataBoundItems="True" CssClass="col-12" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id">
							<asp:ListItem Selected="True" Value="-1">Choose Payment</asp:ListItem>
						</asp:DropDownList>
						<asp:RequiredFieldValidator runat="server" ID="valPaymentReq" ValidationGroup="orderGroup" ControlToValidate="ddPayment" ErrorMessage="*" ForeColor="Red" Display="Dynamic"/>
					<asp:CompareValidator runat="server" ID="valPaymentComp" ValidationGroup="orderGroup" ControlToValidate="ddPayment" ErrorMessage="Select a payment method." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1"></asp:CompareValidator>
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-10">
						<div class="row justify-content-between">
							<div class="col-2">
								<asp:LinkButton ID="btnAddItem" OnClick="btnAddItem_Click" CausesValidation="true" ValidationGroup="itemGroup" CssClass="btn btn-primary float-left" runat="server" Text="Add Item" />
								<asp:LinkButton ID="btnSearchItem" OnClick="btnSearchItem_Click" CausesValidation="true" ValidationGroup="itemGroup" runat="server" Text="" />
							</div>
							<div class="col-3">
							</div>
							<div class="col-2">
								<div class="row justify-content-end mt-2">
									<div class="col-8">
										<asp:Label ID="lblPaid" runat="server" Text="Pay Now" AssociatedControlID="chkPay" />
									</div>
									<div class="col-4">
										<asp:CheckBox ID="chkPay" runat="server" />
									</div>
								</div>
							</div>
							<div class="col-auto">
								<asp:LinkButton ID="btnCompleteSale" OnClick="btnCompleteSale_Click" CausesValidation="true" ValidationGroup="orderGroup" CssClass="btn btn-primary float-right" runat="server" Text="Complete Sale" />

							</div>
							<div class="col-2">
								<asp:LinkButton ID="btnCancelSale" OnClick="btnCancelSale_Click" CausesValidation="false" CssClass="btn btn-danger" runat="server" Text="Cancel Sale" />
							</div>
						</div>
					</div>

				</div>
			</asp:Panel>
			<div class="row mt-3 justify-content-center">
				<div class="col-10">
					<div class="row justify-content-left">
						<div class="col-auto">
							<asp:GridView ID="gridViewOrderItems" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover">
								<Columns>
									<asp:BoundField DataField="ID" HeaderText="Item ID" />
									<asp:BoundField DataField="Name" HeaderText="Item Name" />
									<asp:BoundField DataField="Quantity" HeaderText="Quantity" />
									<asp:BoundField DataField="Price" HeaderText="Price" />
								</Columns>
							</asp:GridView>
						</div>
						<div class="col-5">
							<div class="row">
								<div class="col-6">
									<asp:Label ID="lblSubotal" runat="server" Text="Subtotal" AssociatedControlID="txtSubtotal" />
								</div>
								<div class="col-6">
									<asp:TextBox ID="txtSubtotal" runat="server" CssClass="col-auto" Enabled="false" />
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<asp:Label ID="lblTax" runat="server" Text="Tax(13%)" AssociatedControlID="txtTax" />
								</div>
								<div class="col-6">
									<asp:TextBox ID="txtTax" runat="server" CssClass="col-auto" Enabled="false" />
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<asp:Label ID="lblTotal" runat="server" Text="Total" AssociatedControlID="txtTotal" />
								</div>
								<div class="col-6">
									<asp:TextBox ID="txtTotal" runat="server" CssClass="col-auto" Enabled="false" />
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<asp:ObjectDataSource ID="odsCust" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.SalesPageDataSetTableAdapters.customerTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsPayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.SalesPageDataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsEmp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.SalesPageDataSetTableAdapters.employeeTableAdapter"></asp:ObjectDataSource>

</asp:Content>
