<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmmasSmallEngines._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="LoginContent" runat="server">
	<%--Michael Quill--%>
	<div class="jumbotron">
		<h1>Emmas's Small Engines</h1>
		<p class="lead">Please Login or Register to access the rest of the website.</p>
		<p>
			<asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-primary" OnClick="btnLogin_Click">Login</asp:LinkButton>
			<asp:LinkButton ID="btnRegister" runat="server" CssClass="btn btn-primary" OnClick="btnRegister_Click">Register</asp:LinkButton>
		</p>
	</div>
</asp:Content>
