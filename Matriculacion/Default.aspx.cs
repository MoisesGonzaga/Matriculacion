using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Matriculacion
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillCarreras();
            FillAreas();
            FillCuatris();
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

        public void FillAreas()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnString"].ToString();
            // connection string  
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from Areas Where idCarrera = '"+DDLCarrera.SelectedValue+ "' ORDER BY 2", con);
            // table name   
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset  
            DDLArea.DataTextField = ds.Tables[0].Columns["nombreArea"].ToString(); // text field name of table dispalyed in dropdown       
            DDLArea.DataValueField = ds.Tables[0].Columns["idArea"].ToString();
            // to retrive specific  textfield name   
            DDLArea.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist  
            DDLArea.DataBind();  //binding dropdownlist  
        }

        public void FillCuatris()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnString"].ToString();
            // connection string  
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("select * from Cuatrimestres", con);
            // table name   
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset  
            DDLCuatri.DataTextField = ds.Tables[0].Columns["nombreCuatri"].ToString(); // text field name of table dispalyed in dropdown       
            DDLCuatri.DataValueField = ds.Tables[0].Columns["idCuatri"].ToString();
            // to retrive specific  textfield name   
            DDLCuatri.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist  
            DDLCuatri.DataBind();  //binding dropdownlist  
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

            string grupo, grado, turno, anio;
            int inicialHom, inicialMuj, descHom, descMuj, reinscripcionHom, reinscripcionMuj, idArea, idCuatri;

            grupo = DDLGrupo.SelectedValue;
            grado = DDLGrado.SelectedValue;
            turno = DDLTurno.SelectedValue;
            anio = DDLCuatri.SelectedItem.Text.Substring(DDLCuatri.SelectedItem.Text.Length-4, 4);
            inicialHom = int.Parse(txtIniHombres.Value);
            inicialMuj = int.Parse(txtIniMujeres.Value);
            descHom = int.Parse(txtDesHombres.Value);
            descMuj = int.Parse(txtDesMujeres.Value);
            reinscripcionHom = int.Parse(txtReinsHombres.Value);
            reinscripcionMuj = int.Parse(txtReinsMujeres.Value);
            idArea = int.Parse(DDLArea.SelectedValue);
            idCuatri = int.Parse(DDLCuatri.SelectedValue);


            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO dbo.Matriculas (grupo, grado, turno, anio, qtyIniHom, qtyIniMuj, qtyDiscHom, qtyDiscMuj, reinscHom, reinsMuj,idArea, idCuatri) " +
                        "VALUES (@grupo, @grado, @turno, @anio, @inicialHom, @inicialMuj, @discHom, @discMuj, @reinsHom, @reinsMuj, @idArea, @idCuatri)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@grupo", grupo);
                        cmd.Parameters.AddWithValue("@grado", grado);
                        cmd.Parameters.AddWithValue("@turno", turno);
                        cmd.Parameters.AddWithValue("@anio", anio);
                        cmd.Parameters.AddWithValue("@inicialHom", inicialHom);
                        cmd.Parameters.AddWithValue("@inicialMuj", inicialMuj);
                        cmd.Parameters.AddWithValue("@discHom", descHom);
                        cmd.Parameters.AddWithValue("@discMuj", descMuj);
                        cmd.Parameters.AddWithValue("@reinsHom", reinscripcionHom);
                        cmd.Parameters.AddWithValue("@reinsMuj", reinscripcionMuj);
                        cmd.Parameters.AddWithValue("@idArea", idArea);
                        cmd.Parameters.AddWithValue("@idCuatri", idCuatri);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                LblMensaje.ForeColor = Color.Green;
               LblMensaje.Text = "Metrica registrada exitosamente.";

                Response.AddHeader("Refresh", "5"); // Refresh the page after 5 seconds
            }
            catch (Exception ex)
            {
                LblMensaje.ForeColor = Color.Red;
                LblMensaje.Text = "Ocurrio un error al guardar la informacion en la BD.";
            }

        }

        protected void DDLCarrera_SelectedIndexChanged(object sender, EventArgs e)
        {
            //FillAreas();
            
            DDLArea.Items.Clear();
        }
    }
}