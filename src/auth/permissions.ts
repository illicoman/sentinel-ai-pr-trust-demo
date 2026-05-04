export type UserRole = 'viewer' | 'billing_agent' | 'billing_admin' | 'owner';

const refundRoles = new Set<UserRole>(['billing_admin', 'owner']);
const invoiceExportRoles = new Set<UserRole>(['billing_agent', 'billing_admin', 'owner']);

export function canRefundInvoice(role: UserRole): boolean {
  return refundRoles.has(role);
}

export function canExportInvoices(role: UserRole): boolean {
  return invoiceExportRoles.has(role);
}

export function canEditProductionSettings(role: UserRole): boolean {
  return role === 'owner';
}
