// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace GHCUAT;

using Microsoft.Sales.Customer;

pageextension 51500 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: 05.githubcopilotuat');
    end;
}