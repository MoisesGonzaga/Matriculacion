<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCuatrimestres.aspx.cs" Inherits="Matriculacion.AddCuatrimestres" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Administracion de Cuatrimestres.</h3>
    <p>Formulario para la administracion de Cuatrimestres.</p>

  <div>  
      <form id="Form1" >
      <div class="form-group">
        <label for="txtValueNombre">Nombre</label>
        <input type="text" class="form-control" id="txtCuatri" aria-describedby="emailHelp" runat="server" placeholder="Ingresa Nombre Cuatrimestre">
      </div>

       <div class="form-group">
        <label for="txtValueNombre">Clave</label>
        <input type="text" class="form-control" id="txtClave" aria-describedby="emailHelp" runat="server" placeholder="Ingresa Clave del Cuatrimestre">
      </div>
  
           <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAdd_Click"/> <br /> 
       <asp:Label ID="LblMensaje" runat="server" Font-Size="Small"></asp:Label>
    </form>
    </div>
</asp:Content>
