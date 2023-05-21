<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="EmmasSmallEngines.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%--Michael Quill--%>
	<div class="row">
		<h2 class="mt-3"><%: Title %></h2>
	</div>
	<div id="inventoryTable" runat="server">
		<div class="row justify-content-center">
			<div class="card">
				<div class="card-body">
					<asp:GridView ID="gvInventory" runat="server" AllowSorting="True" AllowPaging="True" AutoGenerateSelectButton="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsInventory" CssClass="col-12 table table-striped mt-3" BorderStyle="Solid" BorderWidth="2px" OnSelectedIndexChanged="gvInventory_SelectedIndexChanged">
						<Columns>
							<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
							<asp:BoundField DataField="invQuantity" HeaderText="Stock" SortExpression="invQuantity" />
							<asp:TemplateField HeaderText="Size" SortExpression="invSize">
								<EditItemTemplate>
									<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("invSize") %>'></asp:TextBox>
								</EditItemTemplate>
								<ItemTemplate>
									<asp:Label ID="Label1" runat="server" Text='<%# Bind("invSize") %>'></asp:Label>
									<asp:Label ID="Label2" runat="server" Text='<%# Eval("invMeasure") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="invPrice" DataFormatString="{0:c}" HeaderText="Price" SortExpression="invPrice" />
							<asp:TemplateField HeaderText="Product Name" SortExpression="prodBrand">
								<EditItemTemplate>
									<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("prodName") %>'></asp:TextBox>
								</EditItemTemplate>
								<ItemTemplate>
									<asp:Label ID="Label3" runat="server" Text='<%# Bind("prodBrand") %>'></asp:Label>
									<asp:Label ID="Label4" runat="server" Text='<%# Eval("prodName") %>'></asp:Label>
									<asp:Label ID="Label5" runat="server" Text='<%# Eval("prodDescription") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="TotalOnOrder" HeaderText="# On Order" ReadOnly="True" SortExpression="TotalOnOrder" />
						</Columns>
					</asp:GridView>
				</div>
			</div>
		</div>
	</div>
	<div id="inventoryDetails" runat="server" visible="false">
		<div class="row mt-3">
			<asp:LinkButton ID="btnReturn" runat="server" CssClass="btn btn-primary" OnClick="btnReturn_Click">Return to Inventory List</asp:LinkButton>
		</div>
		<div class="row mt-3 justify-content-between">
			<div class="card col-12">
				<div class="card-body">
					<div class="row justify-content-center">
						<div class="col-4">
							<asp:DetailsView ID="dvInventoryDetails" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsInventoryByID" BorderStyle="Solid" BorderWidth="2px" CssClass="table table-striped">
								<Fields>
									<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
									<asp:BoundField DataField="invQuantity" HeaderText="Qty" SortExpression="invQuantity" />
									<asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
									<asp:BoundField DataField="invMeasure" HeaderText="Measure" SortExpression="invMeasure" />
									<asp:BoundField DataField="invPrice" HeaderText="Price" SortExpression="invPrice" />
									<asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
									<asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
									<asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
								</Fields>
							</asp:DetailsView>
						</div>
						<div class="col-8">
							<div class="row">
								<asp:LinkButton ID="btnNewOrder" runat="server" CssClass="btn btn-primary" OnClick="btnNewOrder_Click">Create New Order</asp:LinkButton>
							</div>
							<div class="row">
								<asp:GridView ID="gvInventoryOrders" runat="server" DataKeyNames="id" AutoGenerateColumns="False" DataSourceID="odsInventoryOrders" AutoGenerateEditButton="True" BorderStyle="Solid" BorderWidth="2px" CssClass="mt-3 table table-striped">
								<Columns>
									<asp:BoundField DataField="onordInvoiceNum" HeaderText="Invoice #" SortExpression="onordInvoiceNum" ReadOnly="True" />
									<asp:BoundField DataField="pordDateOrdered" HeaderText="Date Ordered" SortExpression="pordDateOrdered" DataFormatString="{0:d}" ReadOnly="True" />
									<asp:BoundField DataField="onordArriveDate" HeaderText="Arrive Date" SortExpression="onordArriveDate" DataFormatString="{0:d}" ReadOnly="True" />
									<asp:BoundField DataField="onordNumInOrder" HeaderText="Qty" SortExpression="onordNumInOrder" ReadOnly="True" />
									<asp:BoundField DataField="onordPrice" HeaderText="Price" SortExpression="onordPrice" DataFormatString="{0:c}" ReadOnly="True" />
									<asp:BoundField DataField="pordNumber" HeaderText="Order #" SortExpression="pordNumber" ReadOnly="True" />
									<asp:CheckBoxField DataField="pordPaid" HeaderText="Paid" SortExpression="pordPaid" />
									<asp:BoundField DataField="inventoryID" HeaderText="Inv. ID" SortExpression="inventoryID" ReadOnly="True" />
								</Columns>
							</asp:GridView>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<asp:ObjectDataSource ID="odsInventoryOrders" runat="server" SelectMethod="GetData" TypeName="EmmasLibrary.InventoryPageDataSetTableAdapters.OrdersTableAdapter" UpdateMethod="UpdatePaid">
		<SelectParameters>
			<asp:ControlParameter ControlID="gvInventory" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="pordPaid" Type="Boolean" />
			<asp:ControlParameter ControlID="gvInventoryOrders" Name="id" PropertyName="SelectedValue" Type="Int32" />
		</UpdateParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsProducts" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.InventoryPageDataSetTableAdapters.ProductTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsInventory" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.InventoryPageDataSetTableAdapters.InventoryTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsInventoryByID" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.InventoryPageDataSetTableAdapters.InventoryTableAdapter">
		<SelectParameters>
			<asp:ControlParameter ControlID="gvInventory" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>
