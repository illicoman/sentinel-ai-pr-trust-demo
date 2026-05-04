export interface ProductionConfig {
  region: string;
  releaseChannel: 'stable' | 'canary';
  invoiceWebhookEnabled: boolean;
}

export const productionConfig: ProductionConfig = {
  region: 'us-east-1',
  releaseChannel: 'stable',
  invoiceWebhookEnabled: true,
};
