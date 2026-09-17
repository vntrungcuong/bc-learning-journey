namespace CuongMai.Fundamentals.Integration.ExternalSalesOrder;

codeunit 50107 "CMI External SO Client"
{
    procedure GetSalesOrderRequest(
        EndpointUrl: Text;
        ResponseText: Text
    )
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
    begin
        Clear(ResponseText);

        if EndpointUrl = '' then
            Error(MissingEndpointErr);

        if not Client.Get(EndpointUrl, Response) then
            Error(HttpTransportErr);

        Response.Content().ReadAs(ResponseText);

        if not Response.IsSuccessStatusCode() then
            Error(
                HttpResponseErr,
                Response.HttpStatusCode(),
                Response.ReasonPhrase(),
                ResponseText
            )
    end;

    var
        MissingEndpointErr:
            Label 'The integration endpoint must be configured.';
        HttpTransportErr:
            Label 'The request could not be sent to the external service.';
        HttpResponseErr:
            Label 'The external service returned HTTP %1 (%2). Response: %3';
}
