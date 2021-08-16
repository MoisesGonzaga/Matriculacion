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
    public partial class AddAreas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillCarreras();
        }

        public void Registrar()
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

            string nombre =  txtNombre.Value;
            int carrera = Convert.ToInt32(DDLCarrera.SelectedValue);
            bool status = chkEstatus.Checked;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO dbo.Areas (nombreArea, activo, idCarrera) VALUES (@nombreArea, @activo, @idCarrera)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@nombreArea", nombre);
                        cmd.Parameters.AddWithValue("@activo", status);
                        cmd.Parameters.AddWithValue("@idCarrera", carrera);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                LblMensaje.ForeColor = Color.Green;
                LblMensaje.Text = "Area registrada exitosamente."  + nombre;

                Response.AddHeader("Refresh", "5"); // Refresh the page after 5 seconds
            }
            catch (Exception ex)
            {
                LblMensaje.ForeColor = Color.Red;
                LblMensaje.Text = "Ocurrio un error al guardar la informacion en la BD.";
            }
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Registrar();
        }

        public void FillCarreras()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnString"].ToString();
            // connection string  
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from Carreras", con);
            // table name   
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset  
            DDLCarrera.DataTextField = ds.Tables[0].Columns["nombreCarrera"].ToString(); // text field name of table dispalyed in dropdown       
            DDLCarrera.DataValueField = ds.Tables[0].Columns["idCarrera"].ToString();
            // to retrive specific  textfield name   
            DDLCarrera.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist  
            DDLCarrera.DataBind();  //binding dropdownlist  
        }
    }
}