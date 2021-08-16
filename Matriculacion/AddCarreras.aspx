<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCarreras.aspx.cs" Inherits="Matriculacion.AddCarreras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Administracion de Carreras.</h3>
    <p>Formulario para la administracion de Carreras.</p>

  <div>  
   <form id="Form1" >
  <div class="form-group">
    <label for="txtValueNombre">Nombre</label>
    <input type="text" class="form-control" id="txtCarrera" aria-describedby="emailHelp" runat="server" placeholder="Ingresa Carrera">

  </div>
  
  <div class="form-group">
    <input type="checkbox" class="form-check-input" id="chkEstatus" runat="server">
    <label class="form-check-label" for="chkEstatus">Estatus</label>
  </div>

       <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAdd_Click" /> <br /> 
   <asp:Label ID="LblMensaje" runat="server" Font-Size="Small"></asp:Label>
</form>
    </div>
</asp:Content>
