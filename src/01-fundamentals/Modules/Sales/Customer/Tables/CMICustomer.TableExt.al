namespace CuongMai.Fundamentals.Sales.Customer;

using Microsoft.Sales.Customer;

// 5011 - Customer Category field ID prefix for this table extension.
// Range from 50000..99999
tableextension 50100 "CMI Customer Ext" extends Customer
{
    fields
    {
        // 50100 - Customer Category field ID for this table extension.
        field(50100; "Customer Category"; Enum "CMI Customer Category")
        {
            Caption = 'Customer Category';
            DataClassification = CustomerContent;
            // ToBeClassified — chưa phân loại (placeholder).
            // CustomerContent — nội dung nghiệp vụ do khách hàng nhập. (nên dùng)
            // EndUserIdentifiableInformation — dữ liệu nhận diện người dùng (PII).
            // SystemMetadata — siêu dữ liệu hệ thống.
            // AccountData — dữ liệu tài khoản/ghi sổ (business/accounting).
        }
    }
}
