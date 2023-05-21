<%@ Page Title="Receipt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="EmmasSmallEngines.Receipt" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%--Michael Quill, Stephen Bodner--%>
	<div class="row justify-content-center">
		<div class="col-10">
			<h2 class="mt-3"><%: Title %></h2>
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-4">
			<div class="card">
				<div class="card-body">
					<div class="row justify-content-center">
						<h4 class="card-title">Receipt Details</h4>
					</div>

					<div class="row justify-content-center">
						<asp:DetailsView ID="dvReceipt" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsReceipt" BorderStyle="Solid" BorderWidth="2px" CssClass="table table-striped" AutoGenerateEditButton="True">
							<Fields>
								<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
								<asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" ReadOnly="True" />
								<asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" DataFormatString="{0:d}" ReadOnly="True" />
								<asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
								<asp:TemplateField HeaderText="Payment" SortExpression="payType">
									<EditItemTemplate>
										<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
										</asp:DropDownList>
									</EditItemTemplate>
									<InsertItemTemplate>
										<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("payType") %>'></asp:TextBox>
									</InsertItemTemplate>
									<ItemTemplate>
										<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("paymentID") %>'>
										</asp:DropDownList>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="custFullName" HeaderText="Customer" ReadOnly="True" SortExpression="custFullName" />
								<asp:BoundField DataField="empFullName" HeaderText="Employee" ReadOnly="True" SortExpression="empFullName" />
							</Fields>
						</asp:DetailsView>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6">
			<div class="card">
				<div class="card-body">
					<div class="row justify-content-center">
						<h4 class="card-title">Items Purchased</h4>
					</div>
					<div class="row justify-content-center">
						<asp:GridView ID="gvOrderLines" runat="server" AutoGenerateColumns="False" DataSourceID="odsOrderLines" BorderStyle="Solid" BorderWidth="2px" CssClass="table table-striped">
							<Columns>
								<asp:BoundField DataField="orlPrice" HeaderText="Price" SortExpression="orlPrice" DataFormatString="{0:c}" />
								<asp:BoundField DataField="orlQuantity" HeaderText="Qty" SortExpression="orlQuantity" />
								<asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
								<asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
							</Columns>
						</asp:GridView>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row justify-content-center mt-3">
		<div class="col-10">
			<div class="card">
				<div class="card-body">
					<div class="row justify-content-center">
						<h4 class="card-title">Services</h4>
					</div>
					<div class="row justify-content-center">
						<asp:GridView ID="gvServiceOrders" runat="server" AutoGenerateColumns="False" DataSourceID="odsServiceOrders" BorderStyle="Solid" BorderWidth="2px" CssClass="table table-striped">
							<Columns>
								<asp:CheckBoxField DataField="serordWarranty" HeaderText="Warranty" SortExpression="serordWarranty" />
								<asp:BoundField DataField="serName" HeaderText="Service" SortExpression="serName" />
								<asp:BoundField DataField="serPrice" HeaderText="Service Price" SortExpression="serPrice" DataFormatString="{0:c}" />
								<asp:BoundField DataField="manName" HeaderText="Equip. Manu." SortExpression="manName" />
								<asp:BoundField DataField="eqtType" HeaderText="Equip. Type" SortExpression="eqtType" />
								<asp:BoundField DataField="equModel" HeaderText="Equip. Model" SortExpression="equModel" />
							</Columns>
						</asp:GridView>
					</div>

				</div>
			</div>
		</div>

	</div>


	<asp:ObjectDataSource ID="odsReceipt" runat="server" SelectMethod="GetData" TypeName="EmmasLibrary.ReceiptPageDataSetTableAdapters.ReceiptTableAdapter" UpdateMethod="UpdateReceipt">
		<SelectParameters>
			<asp:QueryStringParameter Name="Param1" QueryStringField="receiptID" Type="Int32" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="ordPaid" Type="Boolean" />
			<asp:Parameter Name="paymentID" Type="Int32" />
			<asp:Parameter Name="id" Type="Int32" />
		</UpdateParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsOrderLines" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.ReceiptPageDataSetTableAdapters.OrderLineTableAdapter">
		<SelectParameters>
			<asp:QueryStringParameter Name="Param1" QueryStringField="receiptID" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsServiceOrders" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.ReceiptPageDataSetTableAdapters.ServiceOrderTableAdapter">
		<SelectParameters>
			<asp:QueryStringParameter Name="Param1" QueryStringField="receiptID" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsPayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.ReceiptPageDataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
</asp:Content>
