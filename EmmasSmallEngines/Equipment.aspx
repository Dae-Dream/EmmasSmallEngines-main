<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="EmmasSmallEngines.Equipment" %>

<%--Michael Quill, Stephen Bodner--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<h2 class="mt-3"><%: Title %></h2>
	<asp:Label ID="lblCustomer" runat="server" Text="For Customer:" AssociatedControlID="ddCustomer" />
	<asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
	<asp:DropDownList ID="ddCustomer" runat="server" SelectionMode="Single" AutoPostBack="True" DataSourceID="custDropDown" DataTextField="custFullName" DataValueField="id" OnSelectedIndexChanged="ddCustomer_SelectedIndexChanged" AppendDataBoundItems="true">
		<asp:ListItem Text="Select Customer" Enabled="true" />
	</asp:DropDownList>
	<asp:LinkButton ID="btnGoToCustomer" OnClick="btnGoToCustomer_Click" CausesValidation="true" CssClass="btn btn-primary btn-sm" runat="server" Text="Go To Customer" />
	<div class="row mt-2">

		<div class="col-8">
			<div class="card">
				<div class="card-header">
					Equipment Details
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-2">
							<asp:Label ID="lblEquipModel" runat="server" Text="Model" AssociatedControlID="txtEquipModel" />
						</div>
						<div class="col-4">
							<asp:TextBox ID="txtEquipModel" runat="server" />
						</div>
						<div class="col-2">
							<asp:Label ID="lblEquipSerial" runat="server" Text="Serial" AssociatedControlID="txtEquipSerial" />
						</div>
						<div class="col-4">
							<asp:TextBox ID="txtEquipSerial" runat="server" />
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-2">
							<asp:Label ID="lblEquipType" runat="server" Text="Equipment Type" AssociatedControlID="ddEquipType" />
						</div>
						<div class="col-4">
							<asp:DropDownList ID="ddEquipType" runat="server" DataSourceID="typeDropDown" DataTextField="eqtType" DataValueField="id" AppendDataBoundItems="true">
								<asp:ListItem Text="Select Equip. Type" Enabled="true" />
							</asp:DropDownList>
						</div>
						<div class="col-2">
							<asp:Label ID="lblEquipManu" runat="server" Text="Manufacturer" AssociatedControlID="ddEquipManu" />
						</div>
						<div class="col-4">
							<asp:DropDownList ID="ddEquipManu" runat="server" DataSourceID="manuDropTable" DataTextField="manName" DataValueField="id" AppendDataBoundItems="true">
								<asp:ListItem Text="Select Manufacturer" Enabled="true" />
							</asp:DropDownList>
						</div>
					</div>
					<div class="row mt-3 justify-content-between">
						<div class="col-auto">
							<asp:LinkButton ID="btnSaveEquip" OnClick="btnSaveEquip_Click" CausesValidation="true" CssClass="btn btn-primary" runat="server" Text="Save as New Equipment" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="card">
				<div class="card-header">
					Equipment List
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-12">
							<asp:ListBox ID="listEquipment" runat="server" CssClass="form-control col-12" SelectionMode="Single" AutoPostBack="True" OnSelectedIndexChanged="listEquipment_SelectedIndexChanged">
							</asp:ListBox>
						</div>
					</div>
					<div class="row justify-content-between">
						<div class="col-auto">
							<asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" CausesValidation="true" CssClass="btn btn-primary mt-3" runat="server" Text="Delete" />
						</div>
						<div class="col-auto">
							<asp:LinkButton ID="btnRepair" OnClick="btnRepair_Click" CausesValidation="true" CssClass="btn btn-primary mt-3" runat="server" Text="Repair" Enabled="False" />
						</div>
						<div class="col-auto">
							<asp:LinkButton ID="btnEdit" OnClick="btnEdit_Click" CausesValidation="true" CssClass="btn btn-primary mt-3" runat="server" Text="Update"  Enabled="False" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <asp:ObjectDataSource ID="custDropDown" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.EquipmentPageDataSetTableAdapters.customerTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="typeDropDown" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.EquipmentPageDataSetTableAdapters.equip_typeTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="manuDropTable" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.EquipmentPageDataSetTableAdapters.manufacturerTableAdapter"></asp:ObjectDataSource>

</asp:Content>
