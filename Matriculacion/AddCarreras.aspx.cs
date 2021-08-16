using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Matriculacion
{
    public partial class AddCarreras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){

                //do something

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Registrar();
        }

        public void Registrar()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

            string nombre = txtCarrera.Value;
            bool status = chkEstatus.Checked;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO dbo.Carreras (nombreCarrera, Estatus) VALUES (@nombreCarrera, @activo)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@nombreCarrera", nombre);
                        cmd.Parameters.AddWithValue("@activo", status);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                LblMensaje.ForeColor = Color.Green;
                LblMensaje.Text = "Carrera registrada exitosamente." + nombre;

                Response.AddHeader("Refresh", "5"); // Refresh the page after 5 seconds
            }
            catch (Exception ex)
            {
                LblMensaje.ForeColor = Color.Red;
                LblMensaje.Text = "Ocurrio un error al guardar la informacion en la BD.";
            }

        }

    }
}