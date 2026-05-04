export interface BillingWebhookEvent {
  type: 'invoice.created' | 'invoice.paid' | 'invoice.voided';
  invoiceId: string;
  receivedAt: string;
}

export function summarizeWebhook(event: BillingWebhookEvent): string {
  return event.type + ' for invoice ' + event.invoiceId;
}

export function shouldNotifyAccounting(event: BillingWebhookEvent): boolean {
  return event.type === 'invoice.paid' || event.type === 'invoice.voided';
}
