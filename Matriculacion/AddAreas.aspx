<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAreas.aspx.cs" Inherits="Matriculacion.AddAreas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Administracion de Areas.</h3>
    <p>Formulario para la administracion de Areas para la Carrera.</p>
  <div id="mainForm">  
   <form >
  <div class="form-group">
    <label for="txtValueNombre">Nombre</label>
    <input type="text" class="form-control" id="txtNombre" aria-describedby="emailHelp" runat="server" placeholder="Ingresa Area">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
  <div class="form-group">
    <label for="txtValueNombre">Carrera</label>
      <asp:DropDownList class="form-control" ID="DDLCarrera" runat="server" ToolTip="Selecciona Carrera"></asp:DropDownList>
  </div>
  <div class="form-group">
    <input type="checkbox" class="form-check-input" id="chkEstatus" runat="server">
    <label class="form-check-label" for="chkEstatus">Estatus</label>
  </div>
  <%--<button type="submit" class="btn btn-primary">Agregar</button>--%>
   <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAdd_Click" /> <br /> 
   <asp:Label ID="LblMensaje" runat="server" Font-Size="Small"></asp:Label>
</form>
    </div>
</asp:Content>
