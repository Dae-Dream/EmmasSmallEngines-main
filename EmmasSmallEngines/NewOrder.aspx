<%@ Page Title="Create New Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewOrder.aspx.cs" Inherits="EmmasSmallEngines.NewOrder" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%--Michael Quill, Sam Warkentin--%>
	<h2 class="mt-3"><%: Title %></h2>


	<div class="card">

		<div class="card-header">
			<div class="row justify-content-center">
				<div class="col-auto">
					<asp:Label ID="lblOrderNumber" runat="server" Text="Order #" AssociatedControlID="txtOrderNumber"></asp:Label>
				</div>
				<div class="col-2">
					<asp:TextBox ID="txtOrderNumber" TextMode="Number" runat="server"  CssClass="col-12"></asp:TextBox>
					<asp:CompareValidator ID="valOrderNumberMin" runat="server" ErrorMessage="Can't be negative." ForeColor="red" ControlToValidate="txtOrderNumber" ValidationGroup="orderGroup" Operator="GreaterThan" Display="Dynamic" ValueToCompare="0"></asp:CompareValidator>
					<asp:RequiredFieldValidator ID="txtOrderNumberValidator" runat="server" ForeColor="red" ErrorMessage="Order Number is required." ControlToValidate="txtOrderNumber" ValidationGroup="orderGroup" Display="Dynamic"></asp:RequiredFieldValidator>
				</div>
				<div class="col-auto">
					<asp:Label ID="lblOrderDate" runat="server" Text="Order Date" AssociatedControlID="txtOrderDate"></asp:Label>
				</div>
				<div class="col-2">
					<asp:TextBox ID="txtOrderDate" TextMode="Date" runat="server" CssClass="col-12"></asp:TextBox>
					<asp:RequiredFieldValidator ID="txtOrderDataValidator" runat="server" ForeColor="red" ErrorMessage="Order Date is required." ControlToValidate="txtOrderDate" ValidationGroup="orderGroup" Display="Dynamic"></asp:RequiredFieldValidator>
				</div>
				<div class="col-auto">
					<asp:Label ID="lblPaid" runat="server" Text="Paid" AssociatedControlID="chkPaid"></asp:Label>
				</div>
				<div class="col-auto">
					<asp:CheckBox ID="chkPaid" runat="server" />
				</div>
				<div class="col-auto">
					<asp:LinkButton ID="btnSubmitOrder" OnClick="btnSubmitOrder_Click" CausesValidation="true" CssClass="btn btn-primary float-left" runat="server" Text="Submit Order" ValidationGroup="orderGroup" />
				</div>
				<div class="col-auto">
					<asp:LinkButton ID="btnCancelOrder" OnClick="btnCancelOrder_Click" CausesValidation="false" CssClass="btn btn-danger float-left" runat="server" Text="Cancel Order" ValidationGroup="orderGroup" />
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-4">
					<div class="row mt-3">
						<div class="col-5">
							<asp:Label ID="lblItemID" runat="server" Text="Scan or Enter Item ID" AssociatedControlID="txtItemID" />
						</div>
						<div class="col-7">
							<asp:TextBox ID="txtItemID" TextMode="Number" runat="server" CssClass="col-12" AutoPostBack="true" />
							<asp:RangeValidator ID="valItemIDRange" runat="server" ForeColor="Red" ErrorMessage="Item ID out of range." ControlToValidate="txtItemID" ValidationGroup="inventoryGroup" Display="Dynamic" MinimumValue="0" MaximumValue="2147483647"></asp:RangeValidator>
							<asp:RequiredFieldValidator ID="valItemIDReq" runat="server" ForeColor="red" ErrorMessage="Item ID is required." ControlToValidate="txtItemID" ValidationGroup="inventoryGroup" Display="Dynamic"></asp:RequiredFieldValidator>
							<asp:CustomValidator ID="valItemIDCustom" runat="server" OnServerValidate="valItemIDCustom_ServerValidate" ValidationGroup="inventoryGroup" ForeColor="red" ErrorMessage="Item ID not found." ControlToValidate="txtItemID" Display="Dynamic"></asp:CustomValidator>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-5">
							<asp:Label ID="lblQuantity" runat="server" Text="Order Quantity" AssociatedControlID="txtQuantity" />
						</div>
						<div class="col-7">
							<asp:TextBox ID="txtQuantity" TextMode="Number" runat="server" CssClass="col-12" />
							<asp:CompareValidator ID="valQuantityMin" runat="server" ErrorMessage="Can't be negative." ForeColor="red" Display="Dynamic" ControlToValidate="txtQuantity" ValidationGroup="inventoryGroup" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
							<asp:RequiredFieldValidator ID="txtQuantityValidator" runat="server" ForeColor="red" ErrorMessage="Quantity is required." ControlToValidate="txtQuantity" ValidationGroup="inventoryGroup" Display="Dynamic"></asp:RequiredFieldValidator>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-5">
							<asp:Label ID="lblArriveDate" runat="server" Text="Arrive Date" AssociatedControlID="txtArriveDate" />
						</div>
						<div class="col-7">
							<asp:TextBox ID="txtArriveDate" TextMode="Date" runat="server" CssClass="col-12" />
							<asp:RequiredFieldValidator ID="txtArriveDateValidator" runat="server" ForeColor="red" ErrorMessage="Arrive Date is required." ControlToValidate="txtArriveDate" ValidationGroup="inventoryGroup" Display="Dynamic"></asp:RequiredFieldValidator>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-5">
							<asp:Label ID="lblPrice" runat="server" Text="Price" AssociatedControlID="txtPrice" />
						</div>
						<div class="col-7">
							<asp:TextBox ID="txtPrice" TextMode="Number" runat="server" CssClass="col-12" />
							<asp:CompareValidator ID="valPriceMin" runat="server" ErrorMessage="Can't be negative." ForeColor="red" Display="Dynamic" ControlToValidate="txtPrice" ValidationGroup="inventoryGroup" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
							<asp:RequiredFieldValidator ID="txtPriceValidator" runat="server" ForeColor="red" ErrorMessage="Price is required." ControlToValidate="txtPrice" ValidationGroup="inventoryGroup" Display="Dynamic"></asp:RequiredFieldValidator>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-5">
							<asp:Label ID="lblInvoiceNumber" runat="server" Text="Invoice #" AssociatedControlID="txtInvoiceNumber" />
						</div>
						<div class="col-7">
							<asp:TextBox ID="txtInvoiceNumber" TextMode="Number" runat="server" CssClass="col-12" />
							<asp:CompareValidator ID="valInvoiceNumberMin" runat="server" ErrorMessage="Can't be negative." ForeColor="red" Display="Dynamic" ControlToValidate="txtInvoiceNumber" ValidationGroup="inventoryGroup" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
							<asp:RequiredFieldValidator ID="txtInvoiceNumberValidator" runat="server" ForeColor="red" ErrorMessage="Invoice # required." ControlToValidate="txtInvoiceNumber" ValidationGroup="inventoryGroup" Display="Dynamic"></asp:RequiredFieldValidator>
						</div>
					</div>
					<div class="row mt-3 justify-content-center">
						<div class="col-12">
							<asp:LinkButton ID="btnAddItem" OnClick="btnAddItem_Click" CausesValidation="true" CssClass="btn btn-primary float-left" runat="server" Text="Add Item" ValidationGroup="inventoryGroup" />
						</div>
					</div>

				</div>
				<div class="col-auto">
					<div class="row mt-3 justify-content-center">
						<asp:DetailsView ID="dvInventory" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsInventory" BorderStyle="Solid" BorderWidth="2px" CssClass="table table-striped">

							<Fields>
								<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
								<asp:BoundField DataField="invQuantity" HeaderText="Qty in Stock" SortExpression="invQuantity" />
								<asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
								<asp:BoundField DataField="invMeasure" HeaderText="Measure" SortExpression="invMeasure" />
								<asp:BoundField DataField="invPrice" HeaderText="Price" SortExpression="invPrice" DataFormatString="{0:c}" />
								<asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
								<asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
								<asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
							</Fields>

						</asp:DetailsView>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-auto">
					<asp:GridView ID="gvOrder" runat="server" CssClass="table table-striped" BorderStyle="Solid" BorderWidth="2">
					</asp:GridView>
				</div>
			</div>

		</div>
	</div>
	<asp:ObjectDataSource ID="odsInventory" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.NewOrderPageDataSetTableAdapters.InventoryLookupTableAdapter">
		<SelectParameters>
			<asp:ControlParameter ControlID="txtItemID" Name="Param1" PropertyName="Text" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>
