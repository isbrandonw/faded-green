import type { Ai, AiModels, ExportedHandler, Response as WorkerResponse } from "@cloudflare/workers-types";

export interface Env {
  AI: Ai;
}

export default {
  async fetch(request, env: Env): Promise<WorkerResponse> {
    const response = await env.AI.run(
      "@cf/meta/llama-3.1-8b-instruct" as keyof AiModels,
      {
        prompt: "Why should you use Cloudflare for your AI inference?",
      },
      {
        gateway: {
          id: "ai-heaven-gateway"
        },
      },
    );
    return new Response(JSON.stringify(response)) as unknown as WorkerResponse;
  },
} satisfies ExportedHandler<Env>;
