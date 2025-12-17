# Use official devcontainer Node.js image (includes TypeScript, Node 18)
FROM mcr.microsoft.com/devcontainers/typescript-node:1-18-bullseye

# Install system dependencies
RUN apt-get update && \
    apt-get install -y curl git ca-certificates zsh nano && \
    rm -rf /var/lib/apt/lists/*

# Install Bun
#RUN curl -fsSL https://bun.sh/install | bash

# Install pnpm globally
RUN npm install -g pnpm

# Install Yarn (via npm) and enable Corepack (ensures Yarn is available)
RUN npm install -g yarn && corepack enable && corepack prepare yarn@stable --activate

# Add Bun to PATH
#ENV PATH="/root/.bun/bin:${PATH}"

# Install Claude code agent
#RUN npm install -g @anthropic-ai/claude-code

# Set working directory
WORKDIR /workspace/app

# Set default shell to bash (or zsh if preferred)
SHELL ["/bin/zsh", "-c"]

# Expose Nuxt default port
EXPOSE 3000

# Set environment variable for Nuxt to listen on all interfaces
ENV HOST=0.0.0.0

# Optionally, set up a non-root user (uncomment if desired)
# RUN useradd -ms /bin/bash devuser
# USER devuser

# git checkout -b feature/store
# git push -u origin feature/store