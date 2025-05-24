using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Nhom4DoAn_HeThongQuanLyCuaHangTapHoa.QuanLy
{
    public partial class frmQuanLyNhapKho: Form
    {
        // Khai báo
        quanlycuahangtaphoaEntities NK = new quanlycuahangtaphoaEntities();
        private bool isAdding = false;
        public frmQuanLyNhapKho()
        {
            InitializeComponent();
        }

        private void ResetValues_SP()
        {
            txtSoLuong_QLNK.Text = "";
            cboNhaCungCap_QLNK.SelectedIndex = -1;
            cboMatHang_QLNK.SelectedIndex = -1;

            btnLuu_QLNK.Enabled = false;
            btnHuy_QLNK.Enabled = false;
           
            btnThem_QLNK.Enabled = true;

            // Xóa thông báo chế độ thêm nếu có
            lblThem_QLNK.Text = "";
        }
        void LoadData()
        {

            var result = from c in NK.StockIns select new { 
                IDNCC = c.supplierID, 
                IDSP = c.productID, 
                soluong = c.quantity, 
                createAt = c.createdAt
            };
            dgvNhapKho_QLNK.DataSource = result.ToList();
            dgvNhapKho_QLNK.Columns[0].HeaderText = "Mã nhà cung cấp";
            dgvNhapKho_QLNK.Columns[1].HeaderText = "Mã hàng";
            dgvNhapKho_QLNK.Columns[2].HeaderText = "Số lượng";
            dgvNhapKho_QLNK.Columns[3].HeaderText = "Ngày nhập";

            txtSoLuong_QLNK.Clear();

            ResetValues_SP();

            dgvNhapKho_QLNK.CellClick += new DataGridViewCellEventHandler(dgvNhapKho_QLNK_CellContentClick);         
        }
        void addStockIn()
        {
            try
            {
                int idSpThem = Convert.ToInt32(cboMatHang_QLNK.SelectedValue);
                int idNCCThem = Convert.ToInt32(cboNhaCungCap_QLNK.SelectedValue);
                StockIn stThem = NK.StockIns.Find(idSpThem, idNCCThem);
                if (stThem == null)
                {
                    StockIn st = new StockIn() { 
                        productID = idSpThem, 
                        supplierID = Convert.ToInt32(cboNhaCungCap_QLNK.SelectedValue), 
                        quantity = Convert.ToInt32(txtSoLuong_QLNK.Text), 
                        createdAt = DateTime.Now,
                    };
                    NK.StockIns.Add(st);
                }
                else
                {
                    stThem.quantity += Convert.ToInt32(txtSoLuong_QLNK.Text);
                }
                Product spThem = NK.Products.Find(idSpThem);
                spThem.stockOnHand += Convert.ToInt32(txtSoLuong_QLNK.Text);
                NK.SaveChanges();
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Có lỗi: " + ex.Message, "Cảnh báo");
            }

        }

        private void btnThem_QLNK_Click(object sender, EventArgs e)
        {
            // Đặt chế độ thêm
            isAdding = true;

            // Set label thông báo chế độ thêm
            lblThem_QLNK.ForeColor = System.Drawing.Color.Red;
            lblThem_QLNK.Text = "*Bạn đang ở chế độ thêm";

            // Vô hiệu hóa các nút khác
            btnThem_QLNK.Enabled = false;


            // Bật nút "Lưu"
            btnLuu_QLNK.Enabled = true;
            // Bật nút "Hủy"
            btnHuy_QLNK.Enabled = true;

            // Xóa trắng các ô nhập liệu
            txtSoLuong_QLNK.Text = "";
        }

        private void btnLuu_QLNK_Click(object sender, EventArgs e)
        {

            int a;
            if (string.IsNullOrWhiteSpace(txtSoLuong_QLNK.Text))
            {
                MessageBox.Show("Số lượng sản phẩm không được để trống", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (!int.TryParse(txtSoLuong_QLNK.Text, out a))
            {
                MessageBox.Show("Số lương phải là số", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (a <= 0)
            {
                MessageBox.Show("Số lượng phải lớn hơn 0", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
                addStockIn();
        }

        private void btnHuy_QLNK_Click(object sender, EventArgs e)
        {
            ResetValues_SP();
            // Reset trạng thái thêm
            isAdding = false;

            // nếu đang ở chế độ thêm
            if (btnThem_QLNK.Enabled == false)
                lblThem_QLNK.Text = "";
            btnThem_QLNK.Enabled = true;
        }

        private void frmQuanLyNhapKho_Load(object sender, EventArgs e)
        {
            cboNhaCungCap_QLNK.SelectedIndex = -1;
            cboMatHang_QLNK.SelectedIndex = -1;

            LoadData();
            ResetValues_SP();

            var resultNCC = from c in NK.Suppliers select c;
            cboNhaCungCap_QLNK.DataSource = resultNCC.ToList();
            cboNhaCungCap_QLNK.DisplayMember = "name";
            cboNhaCungCap_QLNK.ValueMember = "supplierID";
            var resultSP = from c in NK.Products select c;
            cboMatHang_QLNK.DataSource = resultSP.ToList();
            cboMatHang_QLNK.DisplayMember = "name";
            cboMatHang_QLNK.ValueMember = "productID";
        }

        private void dgvNhapKho_QLNK_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Kiểm tra nếu đang ở chế độ thêm
            if (isAdding)
            {
                MessageBox.Show("Bạn không thể chọn khi đang ở chế độ thêm.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            int d = e.RowIndex;
            
            // Lấy dữ liệu từ DataGridView và hiển thị lên các TextBox
            cboMatHang_QLNK.SelectedValue = Convert.ToInt32(dgvNhapKho_QLNK.Rows[d].Cells[1].Value.ToString());
            cboNhaCungCap_QLNK.SelectedValue = Convert.ToInt32(dgvNhapKho_QLNK.Rows[d].Cells[0].Value.ToString());
            txtSoLuong_QLNK.Text = dgvNhapKho_QLNK.Rows[d].Cells[2].Value.ToString();
        }
    }
}

