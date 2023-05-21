<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="EmmasSmallEngines.Admin" %>

<asp:Content ID="AdminLogin" ContentPlaceHolderID="NotAdminContent" runat="server">
	<%--Michael Quill--%>
	<div class="row mt-5 justify-content-center">
		<div class="col-6">
			<div class="card">
				<div class="card-body">
					<div class="row justify-content-center">
						<h2 class="card-title">Access Denied</h2>
					</div>
					<hr />
					<div class="row justify-content-center">
						<p>Please logout and login as 'admin' account to view this page.</p>
						<p>(Demo Hint: password is 'admin1')</p>
					</div>
					<hr />
					<div class="row justify-content-center">
						
						<asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-primary" OnClick="btnLogout_Click">Logout</asp:LinkButton>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="AdminContent" runat="server">
	<div class="container">
		<div class="row">
			<h2 class="mt-3"><%: Title %></h2>
		</div>
		<div class="card mt-3">
			<div class="card-body">
				<div class="row">
					<asp:LinkButton ID="btnSales" runat="server" OnClick="btnSales_Click"><h3>Sales Info</h3></asp:LinkButton>
				</div>
				<div id="salesDiv" runat="server" class="row justify-content-center" visible="false">
					<asp:GridView ID="gvSales" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SalesDataSource" AllowSorting="True" BorderStyle="Solid" BorderWidth="2px" CssClass="table">
						<Columns>
							<asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
							<asp:BoundField DataField="ordDate" DataFormatString="{0:d}" HeaderText="Date" SortExpression="ordDate" />
							<asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
							<asp:BoundField DataField="custFullName" HeaderText="Customer" SortExpression="custFullName" ReadOnly="True" />
							<asp:BoundField DataField="orderTotal" HeaderText="Total" SortExpression="orderTotal" DataFormatString="{0:c}" ReadOnly="True" />
							<asp:BoundField DataField="payType" HeaderText="Payment" SortExpression="payType" />
							<asp:BoundField DataField="empFullName" HeaderText="Employee" ReadOnly="True" SortExpression="empFullName" />
							<asp:BoundField DataField="itemsPurchased" HeaderText="# of Items" ReadOnly="True" SortExpression="itemsPurchased" />
						</Columns>
						<HeaderStyle BackColor="#EBEBEB" />
					</asp:GridView>
				</div>
			</div>
		</div>
		<div class="card mt-3">
			<div class="card-body">
				<div class="row">

					<asp:LinkButton ID="btnOrders" runat="server" OnClick="btnOrders_Click"><h3>Orders Info</h3></asp:LinkButton>
				</div>
				<div id="ordersDiv" runat="server" class="row justify-content-center" visible="false">
					<asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="OrderDataSource" AllowPaging="True" AllowSorting="True" BorderStyle="Solid" BorderWidth="2px" CssClass="table" PageSize="8">
						<Columns>
							<asp:BoundField DataField="prodName" HeaderText="Prod Name" SortExpression="prodName" />
							<asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
							<asp:BoundField DataField="pordNumber" HeaderText="Order #" SortExpression="pordNumber" />
							<asp:BoundField DataField="pordDateOrdered" HeaderText="Date Ordered" SortExpression="pordDateOrdered" DataFormatString="{0:d}" />
							<asp:CheckBoxField DataField="pordPaid" HeaderText="Paid" SortExpression="pordPaid" />
							<asp:BoundField DataField="onordInvoiceNum" HeaderText="Invoice #" SortExpression="onordInvoiceNum" />
							<asp:BoundField DataField="onordArriveDate" HeaderText="Arrive Date" SortExpression="onordArriveDate" DataFormatString="{0:d}" />
							<asp:BoundField DataField="onordNumInOrder" HeaderText="Qty" SortExpression="onordNumInOrder" />
							<asp:BoundField DataField="onordPrice" HeaderText="Price" SortExpression="onordPrice" DataFormatString="{0:c}" />
						</Columns>
						<HeaderStyle BackColor="#EBEBEB" />
					</asp:GridView>
				</div>
			</div>
		</div>
		<div class="card mt-3">
			<div class="card-body">
				<div class="row">
					<asp:LinkButton ID="btnEmployees" runat="server" OnClick="btnEmployees_Click"><h3>Employees</h3></asp:LinkButton>
				</div>
				<div id="employeesDiv" runat="server" class="row justify-content-center" visible="false">
					<asp:GridView ID="gvEmployees" runat="server" AllowSorting="True" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" CssClass="table" DataKeyNames="id" DataSourceID="EmployeeDataSource">
						<Columns>
							<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
							<asp:BoundField DataField="posName" HeaderText="Position" SortExpression="posName" />
							<asp:BoundField DataField="empFullName" HeaderText="Employee" ReadOnly="True" SortExpression="empFullName" />
							<asp:BoundField DataField="numSales" HeaderText="# Sales" ReadOnly="True" SortExpression="numSales" />
						</Columns>
						<HeaderStyle BackColor="#EBEBEB" />
					</asp:GridView>
				</div>
			</div>
		</div>
		<div class="card mt-3">
			<div class="card-body">
				<div class="row">

					<asp:LinkButton ID="btnManageData" runat="server" OnClick="btnManageData_Click"><h3>Manage Data</h3></asp:LinkButton>
				</div>

				<div id="manageDataDiv" runat="server" class="row justify-content-center" visible="false">
					<div class="col-12">
						<div class="row">
							<h4>Changes on this page are less restriced, be careful.</h4>
						</div>
						<div class="row">
							<div class="card mt-3 col-12">
								<div class="card-body">
									<div>
										<asp:LinkButton ID="btnCustomer" runat="server" OnClick="btnCustomer_Click"><h5>Customer</h5></asp:LinkButton>
									</div>
									<div id="customerDiv" runat="server" class="row justify-content-center" visible="false">
										<asp:GridView ID="gvCustomer" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsCustomer" CssClass="col-12">
											<Columns>
												<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
												<asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" ControlStyle-Width="20px" />
												<asp:BoundField DataField="custFirst" HeaderText="First Name" SortExpression="custFirst" ControlStyle-Width="120px" />
												<asp:BoundField DataField="custLast" HeaderText="Last Name" SortExpression="custLast" ControlStyle-Width="120px" />
												<asp:BoundField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" ControlStyle-Width="100px" />
												<asp:BoundField DataField="custAddress" HeaderText="Address" SortExpression="custAddress" ControlStyle-Width="150px" />
												<asp:BoundField DataField="custCity" HeaderText="City" SortExpression="custCity" ControlStyle-Width="100px" />
												<asp:BoundField DataField="custPostal" HeaderText="Postal Code" SortExpression="custPostal" ControlStyle-Width="100px" />
												<asp:BoundField DataField="custEmail" HeaderText="Email" SortExpression="custEmail" ControlStyle-Width="200px" />
											</Columns>
										</asp:GridView>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="card mt-3 col-12">
								<div class="card-body">
									<div>
										<asp:LinkButton ID="btnReceipt" runat="server" OnClick="btnReceipt_Click"><h5>Receipt</h5></asp:LinkButton>
									</div>
									<div id="receiptDiv" runat="server" class="row justify-content-center" visible="false">
										<div class="row justify-content-center">
											<asp:GridView ID="gvReceipt" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsReceipt">
												<Columns>
													<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
													<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
													<asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
													<asp:BoundField DataField="ordDate" DataFormatString="{0:d}" HeaderText="Date" SortExpression="ordDate" />
													<asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
													<asp:TemplateField HeaderText="Payment" SortExpression="paymentID">
														<EditItemTemplate>
															<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsPayLookup" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
															</asp:DropDownList>
														</EditItemTemplate>
														<ItemTemplate>
															<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsPayLookup" DataTextField="payType" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("paymentID") %>'>
															</asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateField>
													<asp:TemplateField HeaderText="Customer" SortExpression="custID">
														<EditItemTemplate>
															<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="odsCustLookup" DataTextField="custFullName" DataValueField="id" SelectedValue='<%# Bind("custID") %>'>
															</asp:DropDownList>
														</EditItemTemplate>
														<ItemTemplate>
															<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="odsCustLookup" DataTextField="custFullName" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("custID") %>'>
															</asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateField>
													<asp:TemplateField HeaderText="Employee" SortExpression="empID">
														<EditItemTemplate>
															<asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="odsEmpLookup" DataTextField="empFullName" DataValueField="id" SelectedValue='<%# Bind("empID") %>'>
															</asp:DropDownList>
														</EditItemTemplate>
														<ItemTemplate>
															<asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="odsEmpLookup" DataTextField="empFullName" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("empID") %>'>
															</asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateField>
												</Columns>
											</asp:GridView>
										</div>
										<div class="row justify-content-center mt-2">
											<asp:GridView ID="gvOrderLines" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsOrderLine" EmptyDataText="No Order Lines for Receipt">
												<Columns>
													<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
													<asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
													<asp:BoundField DataField="orlPrice" HeaderText="orlPrice" SortExpression="orlPrice" />
													<asp:BoundField DataField="orlQuantity" HeaderText="orlQuantity" SortExpression="orlQuantity" />
													<asp:CheckBoxField DataField="orlOrderReq" HeaderText="orlOrderReq" SortExpression="orlOrderReq" />
													<asp:BoundField DataField="orlNote" HeaderText="orlNote" SortExpression="orlNote" />
													<asp:BoundField DataField="inventoryID" HeaderText="inventoryID" SortExpression="inventoryID" />
													<asp:BoundField DataField="receiptID" HeaderText="receiptID" SortExpression="receiptID" />
												</Columns>
											</asp:GridView>
										</div>
										<div class="row justify-content-center mt-2">
											<asp:GridView ID="gvServiceOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsServiceOrder" AllowPaging="True" EmptyDataText="No Service Orders for Receipt">
												<Columns>
													<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
													<asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
													<asp:BoundField DataField="serordDateIn" HeaderText="serordDateIn" SortExpression="serordDateIn" />
													<asp:BoundField DataField="serordDateOut" HeaderText="serordDateOut" SortExpression="serordDateOut" />
													<asp:BoundField DataField="serordIssue" HeaderText="serordIssue" SortExpression="serordIssue" />
													<asp:CheckBoxField DataField="serordWarranty" HeaderText="serordWarranty" SortExpression="serordWarranty" />
													<asp:BoundField DataField="receiptID" HeaderText="receiptID" SortExpression="receiptID" />
													<asp:BoundField DataField="serviceID" HeaderText="serviceID" SortExpression="serviceID" />
													<asp:BoundField DataField="equipID" HeaderText="equipID" SortExpression="equipID" />
													<asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" />
												</Columns>
											</asp:GridView>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="card mt-3 col-12">
								<div class="card-body">
									<div>
										<asp:LinkButton ID="btnEmployee" runat="server" OnClick="btnEmployee_Click"><h5>Employee</h5></asp:LinkButton>
									</div>
									<div id="employeeDiv" runat="server" class="row justify-content-center" visible="false">
										<asp:LinkButton ID="btnInsertEmployee" runat="server" OnClick="btnInsertEmployee_Click" CssClass="btn btn-primary">New Employee</asp:LinkButton>
										<div id="insertEmployeeDiv" runat="server" class="row justify-content-center mt-3" visible="false">
											<asp:DetailsView ID="dvEmployee" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsEmployee" DefaultMode="Insert">
												<Fields>
													<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
													<asp:BoundField DataField="empFirst" HeaderText="First Name" SortExpression="empFirst" />
													<asp:BoundField DataField="empLast" HeaderText="Last Name" SortExpression="empLast" />
													<asp:TemplateField HeaderText="Position" SortExpression="posID">
														<EditItemTemplate>
															<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posID") %>'></asp:TextBox>
														</EditItemTemplate>
														<InsertItemTemplate>
															<asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="odsPositionLookup" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
															</asp:DropDownList>
														</InsertItemTemplate>
														<ItemTemplate>
															<asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="odsPositionLookup" DataTextField="posName" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("posID") %>'>
															</asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateField>
													<asp:CommandField ShowInsertButton="True" />
												</Fields>
											</asp:DetailsView>
										</div>
										<div class="row mt-3 justify-content-center">
											<asp:GridView ID="gvEmployee" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsEmployee">
												<Columns>
													<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
													<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
													<asp:BoundField DataField="empFirst" HeaderText="First Name" SortExpression="empFirst" />
													<asp:BoundField DataField="empLast" HeaderText="Last Name" SortExpression="empLast" />
													<asp:TemplateField HeaderText="Position" SortExpression="posID">
														<EditItemTemplate>
															<asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="odsPositionLookup" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
															</asp:DropDownList>
														</EditItemTemplate>
														<ItemTemplate>
															<asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="odsPositionLookup" DataTextField="posName" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("posID") %>'>
															</asp:DropDownList>
														</ItemTemplate>
													</asp:TemplateField>
												</Columns>
											</asp:GridView>
										</div>

									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="card mt-3 col-12">
								<div class="card-body">
									<div>
										<asp:LinkButton ID="btnLookupTables" runat="server" OnClick="btnLookupTables_Click"><h5>Lookup Tables</h5></asp:LinkButton>
									</div>
									<div id="lookupTablesDiv" runat="server" class="row justify-content-center" visible="false">
										<div class="row justify-content-center">
											<%--

											Employee Position
											Payment Type
											Manufacturer
											Equipment Type
											Service
											Product

											--%>
											<div class="col-4">
												<div class="card">
													<div class="card-body">
														<div class="row justify-content-center">
															<h5>Employee Positions</h5>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DropDownList ID="ddlPositions" runat="server" DataSourceID="odsPositionLookup" DataTextField="posName" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ddlPositions_SelectedIndexChanged"></asp:DropDownList>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DetailsView ID="dvPositions" runat="server" CssClass="col-12" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsPositionDetails" OnItemDeleted="dvPositions_ItemDeleted" OnItemInserted="dvPositions_ItemInserted" OnItemUpdated="dvPositions_ItemUpdated">
																<Fields>
																	<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
																	<asp:BoundField DataField="posName" HeaderText="Position Name" SortExpression="posName" />
																	<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
																</Fields>
															</asp:DetailsView>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4">
												<div class="card">
													<div class="card-body">
														<div class="row justify-content-center">
															<h5>Payment Types</h5>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DropDownList ID="ddlPayments" runat="server" DataSourceID="odsPayLookup" DataTextField="payType" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DetailsView ID="dvPayments" runat="server" CssClass="col-12" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsPaymentDetails" OnItemDeleted="dvPayments_ItemDeleted" OnItemInserted="dvPayments_ItemInserted" OnItemUpdated="dvPayments_ItemUpdated">
																<Fields>
																	<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
																	<asp:BoundField DataField="payType" HeaderText="Payment Type" SortExpression="payType" />
																	<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
																</Fields>
															</asp:DetailsView>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4">
												<div class="card">
													<div class="card-body">
														<div class="row justify-content-center">
															<h5>Manufacturers</h5>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DropDownList ID="ddlManufacturers" runat="server" AutoPostBack="True" DataSourceID="odsManufacturerLookup" DataTextField="manName" DataValueField="id"></asp:DropDownList>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DetailsView ID="dvManufacturers" runat="server" CssClass="col-12" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsManufacturerDetails" OnItemDeleted="dvManufacturers_ItemDeleted" OnItemInserted="dvManufacturers_ItemInserted" OnItemUpdated="dvManufacturers_ItemUpdated">
																<Fields>
																	<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
																	<asp:BoundField DataField="manName" HeaderText="Manufacturer Name" SortExpression="manName" />
																	<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
																</Fields>
															</asp:DetailsView>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row mt-3 justify-content-center">
											<div class="col-4">
												<div class="card">
													<div class="card-body">
														<div class="row justify-content-center">
															<h5>Equipment Types</h5>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DropDownList ID="ddlEquipTypes" runat="server" AutoPostBack="True" DataSourceID="odsEquipmentTypeLookup" DataTextField="eqtType" DataValueField="id"></asp:DropDownList>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DetailsView ID="dvEquipTypes" runat="server" CssClass="col-12" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsEquipmentTypeDetails" OnItemDeleted="dvEquipTypes_ItemDeleted" OnItemInserted="dvEquipTypes_ItemInserted" OnItemUpdated="dvEquipTypes_ItemUpdated">
																<Fields>
																	<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
																	<asp:BoundField DataField="eqtType" HeaderText="Equipment Type" SortExpression="eqtType" />
																	<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
																</Fields>
															</asp:DetailsView>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4">
												<div class="card">
													<div class="card-body">
														<div class="row justify-content-center">
															<h5>Services</h5>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DropDownList ID="ddlServices" runat="server" AutoPostBack="True" DataSourceID="odsServiceLookup" DataTextField="serName" DataValueField="id"></asp:DropDownList>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DetailsView ID="dvServices" runat="server" CssClass="col-12" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsServicesDetails" OnItemDeleted="dvServices_ItemDeleted" OnItemInserted="dvServices_ItemInserted" OnItemUpdated="dvServices_ItemUpdated">
																<Fields>
																	<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
																	<asp:BoundField DataField="serName" HeaderText="Name" SortExpression="serName" />
																	<asp:BoundField DataField="serDescription" HeaderText="Description" SortExpression="serDescription" />
																	<asp:BoundField DataField="serPrice" HeaderText="Price" SortExpression="serPrice" />
																	<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
																</Fields>
															</asp:DetailsView>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4">
												<div class="card">
													<div class="card-body">
														<div class="row justify-content-center">
															<h5>Products</h5>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" DataSourceID="odsProductLookup" DataTextField="prodDisp" DataValueField="id"></asp:DropDownList>
														</div>
														<div class="row mt-3 justify-content-center">
															<asp:DetailsView ID="dvProducts" runat="server" CssClass="col-12" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsProductDetails" OnItemDeleted="dvProducts_ItemDeleted" OnItemInserted="dvProducts_ItemInserted" OnItemUpdated="dvProducts_ItemUpdated">
																<Fields>
																	<asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
																	<asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
																	<asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
																	<asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
																	<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
																</Fields>
															</asp:DetailsView>
														</div>
													</div>
												</div>
											</div>
										</div>



									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="card mt-3 col-12">
								<div class="card-body">
									<div>
										<asp:LinkButton ID="btnInventory" runat="server" OnClick="btnInventory_Click"><h5>Inventory</h5></asp:LinkButton>
									</div>
									<div id="inventoryDiv" runat="server" class="row justify-content-center" visible="false">
										<p>Not yet implemented.</p>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="card mt-3 col-12">
								<div class="card-body">
									<div>
										<asp:LinkButton ID="btnProductOrder" runat="server" OnClick="btnProductOrder_Click"><h5>Product Order</h5></asp:LinkButton>
									</div>
									<div id="productOrderDiv" runat="server" class="row justify-content-center" visible="false">
										<p>Not yet implemented.</p>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
		<div>
			<asp:ObjectDataSource ID="OrderDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.OrdersSummaryTableAdapter"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="SalesDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.SalesSummaryTableAdapter"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="EmployeeDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.EmployeesSummaryTableAdapter"></asp:ObjectDataSource>

			<asp:ObjectDataSource ID="odsCustomer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.CustomerTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="custFirst" Type="String" />
					<asp:Parameter Name="custLast" Type="String" />
					<asp:Parameter Name="custPhone" Type="String" />
					<asp:Parameter Name="custAddress" Type="String" />
					<asp:Parameter Name="custCity" Type="String" />
					<asp:Parameter Name="custPostal" Type="String" />
					<asp:Parameter Name="custEmail" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="custFirst" Type="String" />
					<asp:Parameter Name="custLast" Type="String" />
					<asp:Parameter Name="custPhone" Type="String" />
					<asp:Parameter Name="custAddress" Type="String" />
					<asp:Parameter Name="custCity" Type="String" />
					<asp:Parameter Name="custPostal" Type="String" />
					<asp:Parameter Name="custEmail" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>

			<asp:ObjectDataSource ID="odsReceipt" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ReceiptTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="ordNumber" Type="String" />
					<asp:Parameter Name="ordDate" Type="DateTime" />
					<asp:Parameter Name="ordPaid" Type="Boolean" />
					<asp:Parameter Name="paymentID" Type="Int32" />
					<asp:Parameter Name="custID" Type="Int32" />
					<asp:Parameter Name="empID" Type="Int32" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="ordNumber" Type="String" />
					<asp:Parameter Name="ordDate" Type="DateTime" />
					<asp:Parameter Name="ordPaid" Type="Boolean" />
					<asp:Parameter Name="paymentID" Type="Int32" />
					<asp:Parameter Name="custID" Type="Int32" />
					<asp:Parameter Name="empID" Type="Int32" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsCustLookup" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.CustomerLookupTableAdapter"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsEmpLookup" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.EmployeeLookupTableAdapter"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsPayLookup" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.PaymentLookupTableAdapter"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsOrderLine" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.AdminDataSetTableAdapters.OrderLineTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="orlPrice" Type="Decimal" />
					<asp:Parameter Name="orlQuantity" Type="Int32" />
					<asp:Parameter Name="orlOrderReq" Type="Boolean" />
					<asp:Parameter Name="orlNote" Type="String" />
					<asp:Parameter Name="inventoryID" Type="Int32" />
					<asp:Parameter Name="receiptID" Type="Int32" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="gvReceipt" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="orlPrice" Type="Decimal" />
					<asp:Parameter Name="orlQuantity" Type="Int32" />
					<asp:Parameter Name="orlOrderReq" Type="Boolean" />
					<asp:Parameter Name="orlNote" Type="String" />
					<asp:Parameter Name="inventoryID" Type="Int32" />
					<asp:Parameter Name="receiptID" Type="Int32" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsServiceOrder" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ServiceOrderTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="serordDateIn" Type="DateTime" />
					<asp:Parameter Name="serordDateOut" Type="DateTime" />
					<asp:Parameter Name="serordIssue" Type="String" />
					<asp:Parameter Name="serordWarranty" Type="Boolean" />
					<asp:Parameter Name="receiptID" Type="Int32" />
					<asp:Parameter Name="serviceID" Type="Int32" />
					<asp:Parameter Name="equipID" Type="Int32" />
					<asp:Parameter Name="empID" Type="Int32" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="gvReceipt" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="serordDateIn" Type="DateTime" />
					<asp:Parameter Name="serordDateOut" Type="DateTime" />
					<asp:Parameter Name="serordIssue" Type="String" />
					<asp:Parameter Name="serordWarranty" Type="Boolean" />
					<asp:Parameter Name="receiptID" Type="Int32" />
					<asp:Parameter Name="serviceID" Type="Int32" />
					<asp:Parameter Name="equipID" Type="Int32" />
					<asp:Parameter Name="empID" Type="Int32" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsServiceLookup" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ServiceLookupTableAdapter"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsEmployee" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.EmployeeTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="empFirst" Type="String" />
					<asp:Parameter Name="empLast" Type="String" />
					<asp:Parameter Name="posID" Type="Int32" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="empFirst" Type="String" />
					<asp:Parameter Name="empLast" Type="String" />
					<asp:Parameter Name="posID" Type="Int32" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsPositionLookup" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.PositionLookupTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="posName" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="posName" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsPositionDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.AdminDataSetTableAdapters.PositionLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="posName" Type="String" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="ddlPositions" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="posName" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsPaymentDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.AdminDataSetTableAdapters.PaymentLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="payType" Type="String" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="ddlPayments" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="payType" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsManufacturerLookup" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ManufacturerLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="manName" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="manName" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsManufacturerDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ManufacturerLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="manName" Type="String" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="ddlManufacturers" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="manName" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsServicesLookup" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ServiceLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="serName" Type="String" />
					<asp:Parameter Name="serDescription" Type="String" />
					<asp:Parameter Name="serPrice" Type="Decimal" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="serName" Type="String" />
					<asp:Parameter Name="serDescription" Type="String" />
					<asp:Parameter Name="serPrice" Type="Decimal" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsServicesDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ServiceLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="serName" Type="String" />
					<asp:Parameter Name="serDescription" Type="String" />
					<asp:Parameter Name="serPrice" Type="Decimal" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="ddlServices" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="serName" Type="String" />
					<asp:Parameter Name="serDescription" Type="String" />
					<asp:Parameter Name="serPrice" Type="Decimal" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsEquipmentTypeLookup" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.EquipmentTypeLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="eqtType" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="eqtType" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsEquipmentTypeDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.AdminDataSetTableAdapters.EquipmentTypeLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="eqtType" Type="String" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="ddlEquipTypes" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="eqtType" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsProductLookup" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ProductLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="prodName" Type="String" />
					<asp:Parameter Name="prodDescription" Type="String" />
					<asp:Parameter Name="prodBrand" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="prodName" Type="String" />
					<asp:Parameter Name="prodDescription" Type="String" />
					<asp:Parameter Name="prodBrand" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsProductDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="EmmasLibrary.AdminDataSetTableAdapters.ProductLookupTableAdapter" UpdateMethod="Update">
				<DeleteParameters>
					<asp:Parameter Name="Original_id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="prodName" Type="String" />
					<asp:Parameter Name="prodDescription" Type="String" />
					<asp:Parameter Name="prodBrand" Type="String" />
				</InsertParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="ddlProducts" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
				</SelectParameters>
				<UpdateParameters>
					<asp:Parameter Name="prodName" Type="String" />
					<asp:Parameter Name="prodDescription" Type="String" />
					<asp:Parameter Name="prodBrand" Type="String" />
					<asp:Parameter Name="Original_id" Type="Int32" />
				</UpdateParameters>
			</asp:ObjectDataSource>
		</div>
	</div>

</asp:Content>
