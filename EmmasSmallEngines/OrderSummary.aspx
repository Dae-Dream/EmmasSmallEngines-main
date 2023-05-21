<%@ Page Title="Order Summary" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="EmmasSmallEngines.OrderSummary" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%--Michael Quill--%>
	<div class="row justify-content-center">
		<div class="col-10">
			<h2 class="mt-3"><%: Title %></h2>
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-auto">
			<div class="card">
				<div class="card-body">
					<div class="row justify-content-center">
						<h4 class="card-title">Order Details</h4>
					</div>

					<div class="row justify-content-center">
						<asp:DetailsView ID="dvOrder" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsProdOrder" CssClass="table table-striped" BorderStyle="Solid" BorderWidth="2px">
							<Fields>
								<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
								<asp:BoundField DataField="pordNumber" HeaderText="Number" SortExpression="pordNumber" />
								<asp:BoundField DataField="pordDateOrdered" DataFormatString="{0:d}" HeaderText="Date Ordered" SortExpression="pordDateOrdered" />
								<asp:CheckBoxField DataField="pordPaid" HeaderText="Paid" SortExpression="pordPaid" />
							</Fields>
						</asp:DetailsView>
					</div>
				</div>
			</div>
		</div>
		<div class="col-auto">
			<div class="card">
				<div class="card-body">
					<div class="row justify-content-center">
						<h4 class="card-title">Items Ordered</h4>
					</div>
					<div class="row justify-content-center">
						<asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsOnOrder" CssClass="table table-striped" BorderStyle="Solid" BorderWidth="2px">
							<Columns>
								<asp:BoundField DataField="onordInvoiceNum" HeaderText="Invoice #" SortExpression="onordInvoiceNum" />
								<asp:BoundField DataField="onordArriveDate" HeaderText="Arrive Date" SortExpression="onordArriveDate" DataFormatString="{0:d}" />
								<asp:BoundField DataField="onordNumInOrder" HeaderText="Order Qty" SortExpression="onordNumInOrder" />
								<asp:BoundField DataField="onordPrice" HeaderText="Price" SortExpression="onordPrice" />
								<asp:BoundField DataField="prodDisp" HeaderText="Product" SortExpression="prodDisp" ReadOnly="True" />
							</Columns>
						</asp:GridView>
					</div>
				</div>
			</div>
		</div>
	</div>
	<asp:ObjectDataSource ID="odsProdOrder" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.OrderSummaryPageDataSetTableAdapters.ProdOrderTableAdapter">
		<SelectParameters>
			<asp:QueryStringParameter Name="Param1" QueryStringField="orderID" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsOnOrder" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.OrderSummaryPageDataSetTableAdapters.OnOrderTableAdapter">
		<SelectParameters>
			<asp:QueryStringParameter Name="Param1" QueryStringField="orderID" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
	</asp:Content>
