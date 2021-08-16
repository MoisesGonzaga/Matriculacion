<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Matriculacion._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="Titulo">
        <h2>Panel de Inicio</h2>
    </div>

    <div id="Registrar">
        <a class="btn btn-primary" onclick="myFunction()">&raquo; Agregar nueva metrica</a>
    </div>
    <div class="row" id="Controles" style="display:none">
        <div class="col-md-4" id="Generales">
            <h4 style="border:2px solid #73AD21; border-radius:5px; font-weight:bold; padding:6px">Datos Generales</h4>
            <p></p>

            <div class="form-group">
                <label for="txtValueCarrera">Carrera</label>
                <asp:DropDownList class="form-control" ID="DDLCarrera" runat="server" OnSelectedIndexChanged="DDLCarrera_SelectedIndexChanged"  ToolTip="Selecciona Carrera">
                </asp:DropDownList>
                <br />
                <label for="txtValueArea">Area</label>
                <asp:DropDownList class="form-control" ID="DDLArea" runat="server"  ToolTip="Selecciona un Area">
                </asp:DropDownList>
                <br />
                <label style="resize:inherit" for="txtValueCuatri">Cuatrimestre</label>
                <asp:DropDownList class="form-control" ID="DDLCuatri" runat="server"  ToolTip="Selecciona un Cuatrimestre">
                </asp:DropDownList>
             </div>
           <div id="wrapper">
                <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAdd_Click"/> <br /> 
                <asp:Label ID="LblMensaje" runat="server" Font-Size="Small"></asp:Label>
            </div>  
            <%--<p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>--%>
        </div>
        <div class="col-md-4" id="Especificos">
            <h4 style="border:2px solid #73AD21; border-radius:5px; font-weight:bold; padding:6px">Datos Especificos</h4>
            <p></p>
            <div class="form-group">
                <label for="txtValueGrado">Grado</label>
                <asp:DropDownList class="form-control" ID="DDLGrado" runat="server"   ToolTip="Selecciona un Grado">
                    <asp:ListItem>Seleccione Grado</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                </asp:DropDownList>
                <br />
                <label for="txtValueGrupo">Grupo</label>
                <asp:DropDownList class="form-control" ID="DDLGrupo" runat="server"  ToolTip="Selecciona un Grupo">
                    <asp:ListItem>Seleccione Grupo</asp:ListItem>
                    <asp:ListItem>A</asp:ListItem>
                    <asp:ListItem>B</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                    <asp:ListItem>D</asp:ListItem>
                    <asp:ListItem>E</asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                    <asp:ListItem>G</asp:ListItem>
                    <asp:ListItem>H</asp:ListItem>
                    <asp:ListItem>I</asp:ListItem>
                    <asp:ListItem>J</asp:ListItem>
                    <asp:ListItem>K</asp:ListItem>
                    <asp:ListItem>L</asp:ListItem>
                    <asp:ListItem>M</asp:ListItem>
                    <asp:ListItem>N</asp:ListItem>
                    <asp:ListItem>O</asp:ListItem>
                    <asp:ListItem>P</asp:ListItem>
                    <asp:ListItem>Q</asp:ListItem>
                    <asp:ListItem>R</asp:ListItem>
                    <asp:ListItem>S</asp:ListItem>
                    <asp:ListItem>T</asp:ListItem>
                    <asp:ListItem>U</asp:ListItem>
                    <asp:ListItem>V</asp:ListItem>
                    <asp:ListItem>W</asp:ListItem>
                    <asp:ListItem>X</asp:ListItem>
                    <asp:ListItem>Y</asp:ListItem>
                    <asp:ListItem>Z</asp:ListItem>
                </asp:DropDownList>
                <br />
                <label for="txtValueTurno">Turno</label>
                <asp:DropDownList class="form-control" ID="DDLTurno" runat="server"  ToolTip="Selecciona un Turno">
                    <asp:ListItem>Seleccione Turno</asp:ListItem>
                    <asp:ListItem>Matutino</asp:ListItem>
                    <asp:ListItem>Vespertino</asp:ListItem>
                    <asp:ListItem>Despresurizado</asp:ListItem>
                </asp:DropDownList>
             </div>
        </div>
        <div class="col-md-4" id="Matricula">
            <h4 style="border:2px solid #73AD21; border-radius:5px; font-weight:bold; padding:6px">Datos de Matricula</h4>
            <p></p>
            <div class="row">
                <div class="col-6 col-md-6">
                    <label for="txtValueIniHombres">Inicial Hombres</label>
                    <input type="text" class="form-control" id="txtIniHombres" runat="server" placeholder="Ingresa Cantidad">
                </div>
                <div class="col-6 col-md-6">
                     <label for="txtValueIniMujeres">Inicial Mujeres</label>
                    <input type="text" class="form-control" id="txtIniMujeres" runat="server" placeholder="Ingresa Cantidad">
                </div>
               
            </div>
            <br />
            <div class="row">
                <div class="col-6 col-md-6">
                        <label for="txtValueDesHombres">Desersion Hombres</label>
                        <input type="text" class="form-control" id="txtDesHombres" runat="server" placeholder="Ingresa Cantidad">
                </div>
                <div class="col-6 col-md-6">
                     <label for="txtValueDesMujeres">Desersion Mujeres</label>
                      <input type="text" class="form-control" id="txtDesMujeres" runat="server" placeholder="Ingresa Cantidad">
                </div>
               
            </div>

            <br />
            <div class="row">
                <div class="col-6 col-md-6">
                        <label for="txtValueReinsHombres">Reinscripcion Hombres</label>
                        <input type="text" class="form-control" id="txtReinsHombres" runat="server" placeholder="Ingresa Cantidad">
                </div>
                <div class="col-6 col-md-6">
                     <label for="txtValueReinsMujeres">Reinscripcion Mujeres</label>
                      <input type="text" class="form-control" id="txtReinsMujeres" runat="server" placeholder="Ingresa Cantidad">
                </div>
               
            </div>

        </div>
         
    </div>
   
    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <script>
        function myFunction() {
            var x = document.getElementById("Controles");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>
</asp:Content>
