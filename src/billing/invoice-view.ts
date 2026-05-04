export type InvoiceStatus = 'draft' | 'open' | 'paid' | 'void';

export interface InvoiceView {
  id: string;
  customerName: string;
  amountCents: number;
  status: InvoiceStatus;
}

export function renderInvoiceStatus(invoice: InvoiceView): string {
  if (invoice.status === 'paid') {
    return 'Payment received';
  }
  if (invoice.status === 'void') {
    return 'Void';
  }
  if (invoice.status === 'open') {
    return 'Payment due';
  }
  return 'Draft';
}

export function renderInvoiceAmount(invoice: InvoiceView): string {
  return '$' + (invoice.amountCents / 100).toFixed(2);
}
