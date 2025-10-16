select v.vendor_name, v.vendor_contact_last_name, i.invoice_number, i.invoice_date -- selecting
from vendors as v -- giving an alias (v)
 join invoices as i -- inner joining
 on v.vendor_id = i.vendor_id -- IMPORTANT
-- ambiguous error same field with same name - workbench stupid
-- need to use dot notation to specify the table.field
where vendor_contact_last_name like 'B%'
order by invoice_date desc

-- important to join in pairs
select *
from vendors as v
join invoices as i
on v.vendor_id = i.vendor_id
join invoice_line_items ili
on i.invoice_id = ili.invoice_id
join general_ledger_accounts as gla
on ili.account_number = gla.account_number


