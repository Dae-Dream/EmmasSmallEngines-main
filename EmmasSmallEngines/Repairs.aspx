<%@ Page Title="Service and Repairs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Repairs.aspx.cs" Inherits="EmmasSmallEngines.Repairs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%--Michael Quill, Stephen Bodner, Sam Warkentin--%>
	<div class="container">
		<h2 class="mt-3"><%: Title %></h2>
		<div class="card">
			<div class="card-header">
				<div class="row justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblEmployee" runat="server" Text="Employee" AssociatedControlID="ddEmployee" />
					</div>
					<div class="col-3">
						<asp:DropDownList ID="ddEmployee" runat="server" CssClass="col-12" DataSourceID="odsEmp" DataTextField="empFullName" DataValueField="id" AppendDataBoundItems="True">
							<asp:ListItem Text="Select Employee" Value="-1"></asp:ListItem>
						</asp:DropDownList>
						<asp:RequiredFieldValidator runat="server" ID="valEmployeeReq" ValidationGroup="orderGroup" ControlToValidate="ddEmployee" ErrorMessage="*" ForeColor="Red" Display="Dynamic" />
						<asp:CompareValidator runat="server" ID="valEmployeeComp" ValidationGroup="orderGroup" ControlToValidate="ddEmployee" ErrorMessage="Select an employee." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
					</div>
					<div class="col-2">
						<asp:Label ID="lblOrderNumber" runat="server" Text="Order #" AssociatedControlID="txtOrderNumber" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtOrderNumber" TextMode="Number" runat="server" CssClass="col-12" />
						<asp:CompareValidator ID="valOrderNumberMin" runat="server" ErrorMessage="Can't be negative." ForeColor="red" Display="Dynamic" ControlToValidate="txtOrderNumber" ValidationGroup="orderGroup" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
						<asp:RequiredFieldValidator ID="valOrderNumberReq" runat="server" ValidationGroup="orderGroup" ForeColor="red" ErrorMessage="Order number is required." ControlToValidate="txtOrderNumber" Display="Dynamic"></asp:RequiredFieldValidator>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="row justify-content-center">
					<div class="col-10">
						<h5 class="card-title">Customer Info</h5>
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblName" runat="server" Text="Name" AssociatedControlID="ddCustomers" />
					</div>
					<div class="col-3">
						<asp:DropDownList ID="ddCustomers" runat="server" AutoPostBack="True" CssClass="col-12" DataSourceID="odsCust" DataTextField="custFullName" DataValueField="id" AppendDataBoundItems="True" OnSelectedIndexChanged="ddCustomers_SelectedIndexChanged">
							<asp:ListItem Text="Select Customer" Value="-1"></asp:ListItem>
						</asp:DropDownList>
						<asp:RequiredFieldValidator runat="server" ID="valCustomerReq" ValidationGroup="orderGroup" ControlToValidate="ddCustomers" ErrorMessage="*" ForeColor="Red" Display="Dynamic"/>
						<asp:CompareValidator runat="server" ID="valCustomerComp" ValidationGroup="orderGroup" ControlToValidate="ddCustomers" ErrorMessage="Select a customer." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
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
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblEquipment" runat="server" Text="Equipment" AssociatedControlID="txtAddress" />
						<asp:LinkButton ID="btnNewEquipment" OnClick="btnNewEquipment_Click" CssClass="btn btn-outline-success btn-sm" runat="server" Text="New" />
					</div>
					<div class="col-3">
						<asp:DropDownList ID="ddEquipment" runat="server" CssClass="col-12" AutoPostBack="True" OnSelectedIndexChanged="ddEquipment_SelectedIndexChanged">
							
						</asp:DropDownList>
						<asp:RequiredFieldValidator runat="server" ID="valEquipmentReq" ValidationGroup="serviceGroup" ControlToValidate="ddEquipment" ErrorMessage="*" ForeColor="Red" Display="Dynamic" />
						<asp:CompareValidator runat="server" ID="valEquipmentComp" ValidationGroup="serviceGroup" ControlToValidate="ddEquipment" ErrorMessage="Select equipment." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
					</div>
					<div class="col-2">
						<asp:Label ID="lblWarranty" runat="server" Text="Warranty" />
					</div>
					<div class="col-3">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<asp:LinkButton ID="btnWarrantyNo" OnClick="btnWarrantyNo_Click" CssClass="btn btn-danger btn-sm active" runat="server" Text="No" />
							<asp:LinkButton ID="btnWarrantyYes" OnClick="btnWarrantyYes_Click" CssClass="btn btn-secondary btn-sm" runat="server" Text="Yes" />
						</div>
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblModel" runat="server" Text="Model" AssociatedControlID="txtModel" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtModel" runat="server" Enabled="false" CssClass="col-12" />
					</div>
					<div class="col-2">
						<asp:Label ID="lblSerial" runat="server" Text="Serial #" AssociatedControlID="txtSerial" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtSerial" runat="server" Enabled="false" CssClass="col-12" />
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblServices" runat="server" Text="Service To Be Done" AssociatedControlID="ddServices" />
					</div>
					<div class="col-3">
						<asp:DropDownList ID="ddServices" runat="server" CssClass="col-12" DataSourceID="odsService" DataTextField="serName" DataValueField="id" AppendDataBoundItems="True" Style="left: 0px; top: 0px">
							<asp:ListItem Text="Select Service" Value="-1"></asp:ListItem>
						</asp:DropDownList>
						<asp:RequiredFieldValidator runat="server" ID="valServicesReq" ValidationGroup="serviceGroup" ControlToValidate="ddServices" ErrorMessage="*" ForeColor="Red" Display="Dynamic" />
						<asp:CompareValidator runat="server" ID="valServicesComp" ValidationGroup="serviceGroup" ControlToValidate="ddServices" ErrorMessage="Select a service." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
					</div>
					<div class="col-2">
						<asp:LinkButton ID="btnNewService" OnClick="btnNewService_Click" CausesValidation="true" ValidationGroup="newServiceGroup" CssClass="btn btn-outline-success btn-sm mt-2" runat="server" Text="Add New Service" />
					</div>
					<div class="col-3">
						<div class="row">
							<asp:RequiredFieldValidator ID="valNewServiceReq" runat="server" ValidationGroup="newServiceGroup" ControlToValidate="txtNewService" ErrorMessage="Service Name required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
							<asp:RequiredFieldValidator ID="valNewServicePriceReq" runat="server" ValidationGroup="newServiceGroup" ControlToValidate="txtNewServicePrice" ErrorMessage="Service Price required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
							<asp:RequiredFieldValidator ID="valNewServiceDescReq" runat="server" ValidationGroup="newServiceGroup" ControlToValidate="txtNewServiceDesc" ErrorMessage="Service Description required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
							<div class="col-8 pr-1">
								<asp:TextBox ID="txtNewService" runat="server" CssClass="col-12" Placeholder="Service Name" />
							</div>
							<div class="col-4 pl-0">
								<asp:TextBox ID="txtNewServicePrice" TextMode="Number" runat="server" CssClass="col-12" Placeholder="Price" />
								<asp:CompareValidator ID="valNewServicePriceMin" runat="server" ErrorMessage="Can't be negative." ForeColor="red" Display="Dynamic" ControlToValidate="txtNewServicePrice" ValidationGroup="newServiceGroup" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col-12">
								<asp:TextBox ID="txtNewServiceDesc" runat="server" CssClass="col-12" Placeholder="Desc" />
							</div>
						</div>
					</div>
				</div>

				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblDateIn" runat="server" Text="Date In" AssociatedControlID="txtDateIn" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtDateIn" TextMode="Date" runat="server" CssClass="col-12" />
						<asp:RequiredFieldValidator ID="valDateInReq" runat="server" ValidationGroup="serviceGroup" ControlToValidate="txtDateIn" ErrorMessage="Date In required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
					</div>
					<div class="col-2">
						<asp:Label ID="lblDateOut" runat="server" Text="Date Out" AssociatedControlID="txtDateOut" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtDateOut" TextMode="Date" runat="server" CssClass="col-12" />
						<asp:RequiredFieldValidator ID="valDateOutReq" runat="server" ValidationGroup="serviceGroup" ControlToValidate="txtDateOut" ErrorMessage="Date Out required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblNotes" runat="server" Text="Job Notes" AssociatedControlID="txtNotes" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtNotes" TextMode="MultiLine" runat="server" CssClass="col-12" Rows="6" />
					</div>
					<div class="col-2">
						<asp:Label ID="lblServiceEmployee" runat="server" Text="Technician" AssociatedControlID="ddServiceEmployee" />
					</div>
					<div class="col-3">
						<div class="row">
							<div class="col-12">
								<asp:DropDownList ID="ddServiceEmployee" runat="server" CssClass="col-12" DataSourceID="odsEmp" DataTextField="empFullName" DataValueField="id" AppendDataBoundItems="True">
									<asp:ListItem Text="Select Employee" Value="-1"></asp:ListItem>
								</asp:DropDownList>
								<asp:RequiredFieldValidator runat="server" ID="valServiceEmployeeReq" ValidationGroup="serviceGroup" ControlToValidate="ddServiceEmployee" ErrorMessage="*" ForeColor="Red" Display="Dynamic" />
								<asp:CompareValidator runat="server" ID="valServiceEmployeeComp" ValidationGroup="serviceGroup" ControlToValidate="ddServiceEmployee" ErrorMessage="Select an employee." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
							</div>

						</div>
						<div class="row mt-5 justify-content-center">
							<asp:LinkButton ID="btnAddItem" OnClick="btnAddItem_Click" CausesValidation="true" ValidationGroup="serviceGroup" CssClass="btn btn-primary float-left" runat="server" Text="Add Service to Receipt" />
						</div>

					</div>


				</div>
			</div>
		</div>
		<div class="card mt-3">
			<div class="card-body">
				<div class="row mt-3 justify-content-center">
					<div class="col-5">
						<asp:GridView ID="gvServices" runat="server" AutoGenerateDeleteButton="True" BorderStyle="Solid" BorderWidth="2px" CssClass="table table-striped" OnRowDeleting="gvServices_RowDeleting" ></asp:GridView>
					</div>
					<div class="col-5">
						<div class="row">
							<div class="col-6">
								<div class="row justify-content-center">
									<asp:LinkButton ID="btnSubmitReprt" OnClick="btnSubmitReport_Click" ValidationGroup="orderGroup" CausesValidation="true" CssClass="btn btn-primary" runat="server" Text="Submit Report" />
								</div>
								<div class="row mt-3 justify-content-center">
									<div class="col-auto">
										<asp:Label ID="lblPaid" runat="server" Text="Pay Now" AssociatedControlID="chkPay" />
									</div>
									<div class="col-auto">
										<asp:CheckBox ID="chkPay" runat="server" />
									</div>
								</div>
								<div class="row mt-3 justify-content-center">
									<asp:DropDownList ID="ddPayment" runat="server" AppendDataBoundItems="True" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id">
										<asp:ListItem Value="-1">Select Payment</asp:ListItem>
									</asp:DropDownList>
									<asp:RequiredFieldValidator runat="server" ID="valPaymentReq" ValidationGroup="orderGroup" ControlToValidate="ddPayment" ErrorMessage="*" ForeColor="Red" Display="Dynamic" />
									<asp:CompareValidator runat="server" ID="valPaymentComp" ValidationGroup="orderGroup" ControlToValidate="ddPayment" ErrorMessage="Select Payment." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
								</div>
							</div>
							<div class="col-6">
								<asp:LinkButton ID="btnCancelReport" OnClick="btnCancelReport_Click" CausesValidation="false" CssClass="btn btn-danger" runat="server" Text="Cancel Report" />

							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<asp:ObjectDataSource ID="odsPayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.RepairsPageDataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsCust" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.RepairsPageDataSetTableAdapters.CustomerTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsEmp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.RepairsPageDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsEquip" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.RepairsPageDataSetTableAdapters.EquipmentTableAdapter">
		<SelectParameters>
			<asp:ControlParameter ControlID="ddCustomers" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsService" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.RepairsPageDataSetTableAdapters.ServiceTableAdapter"></asp:ObjectDataSource>
</asp:Content>
