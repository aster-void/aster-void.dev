<script lang="ts">
  import Icon from "@iconify/svelte";
  import GridOverlay from "../GridOverlay.svelte";
  import Navigation from "../Navigation.svelte";

  type WorkType = "personal" | "team";

  type Tag = keyof typeof tagIcons;
  const tagIcons = {
    Nix: "simple-icons:nixos",
    IME: "mdi:keyboard",
    Japanese: "circle-flags:jp",
    CLI: "mdi:console",
    MCP: "mdi:connection",
    Education: "mdi:school",
    Productivity: "mdi:clock-check",
    Web: "mdi:web",
    Rust: "simple-icons:rust",
    WASM: "simple-icons:webassembly",
    Game: "mdi:gamepad-variant",
    Matching: "mdi:account-search",
    Health: "mdi:heart-pulse",
    International: "mdi:earth",
    Canvas: "mdi:palette",
    Realtime: "mdi:lightning-bolt",
  };

  interface Work {
    title: string;
    description: string;
    tags: Tag[];
    links: {
      github?: string;
      website?: string;
      article?: string;
    };
    screenshot?: string;
    type: WorkType;
    archived?: boolean;
  }

  const works: Work[] = [
    // Featured
    {
      title: "nix-hazkey",
      description: "fcitx5-hazkey の Nix 環境向けパッケージ (Home-Manager, NixOS)",
      tags: ["Nix", "IME", "Japanese"],
      links: {
        github: "https://github.com/aster-void/nix-hazkey",
      },
      type: "personal",
    },
    {
      title: "climcp",
      description: "MCPサーバーを CLI で操作できるツール",
      tags: ["CLI", "MCP"],
      links: {
        github: "https://github.com/aster-void/climcp",
        website: "https://www.npmjs.com/package/climcp",
      },
      type: "personal",
    },
    // Archived
    {
      title: "CourseMate",
      description: "大学生活をもっと楽しく。同じ授業を履修している友達を見つけられるアプリ",
      tags: ["Web", "Education", "Matching"],
      links: {
        github: "https://github.com/ut-code/CourseMate",
      },
      screenshot: "/screenshots/placeholder.svg",
      type: "team",
      archived: true,
    },
    {
      title: "Habit Relay",
      description: "チームで運動習慣を継続するためのアプリ。リレー形式でモチベーションを維持。",
      tags: ["Web", "Health", "Productivity"],
      links: {},
      screenshot: "/screenshots/placeholder.svg",
      type: "team",
      archived: true,
    },
    {
      title: "ut-bridge",
      description: "留学生と日本人学生の交流を促進するツール",
      tags: ["Web", "Education", "International"],
      links: {
        github: "https://github.com/ut-code/ut-bridge",
      },
      screenshot: "/screenshots/placeholder.svg",
      type: "team",
      archived: true,
    },
    {
      title: "how-match",
      description: "チーム振り分けを簡単にするアプリ",
      tags: ["Web", "Matching"],
      links: {
        github: "https://github.com/ut-code/how-match",
      },
      screenshot: "/screenshots/placeholder.svg",
      type: "team",
      archived: true,
    },
    {
      title: "uplace",
      description: "リアルタイムで色塗りをするアプリ (五月祭企画)",
      tags: ["Web", "Canvas", "Realtime"],
      links: {
        github: "https://github.com/ut-code/uplace",
      },
      screenshot: "/screenshots/placeholder.svg",
      type: "team",
      archived: true,
    },
    {
      title: "ai-othello",
      description: "ブラウザ上でAIと対戦できるオセロゲーム (五月祭企画)",
      tags: ["Web", "Rust", "WASM", "Game"],
      links: {
        github: "https://github.com/ut-code/ai-othello",
      },
      screenshot: "/screenshots/placeholder.svg",
      type: "personal",
      archived: true,
    },
  ];

  const featuredWorks = works.filter((w) => !w.archived);
  const archivedWorks = works.filter((w) => w.archived);
</script>

<GridOverlay />
<Navigation />

<div class="content-layer min-h-screen px-4 pt-24 pb-16 sm:px-6 lg:px-8">
  <div class="mx-auto max-w-6xl">
    <!-- Header -->
    <div
      class="mb-16 space-y-4 text-center"
      style="animation: slideInUp 0.8s cubic-bezier(0.16, 1, 0.3, 1)"
    >
      <h1 class="text-5xl font-bold sm:text-6xl">
        <span
          class="bg-gradient-to-r from-[var(--accent-cyan)] via-[var(--accent-purple)] to-[var(--accent-pink)] bg-clip-text text-transparent"
        >
          My Works
        </span>
      </h1>
      <p class="font-mono text-lg text-[var(--text-secondary)]">プロジェクトとエクスペリメント</p>
    </div>

    <!-- Featured Works -->
    {#if featuredWorks.length > 0}
      <section class="mb-16">
        <h2
          class="mb-8 flex items-center gap-2 font-mono text-2xl font-bold text-[var(--accent-cyan)]"
        >
          <span class="text-[var(--accent-purple)]">{">"}</span>
          Featured
        </h2>
        <div class="grid gap-6 md:grid-cols-2">
          {#each featuredWorks as work, i}
            <article
              class="group relative overflow-hidden rounded-xl border border-[var(--accent-cyan)]/20 bg-[var(--bg-dark)]/50 p-6
								backdrop-blur-sm transition-all duration-500 hover:border-[var(--accent-cyan)]/60
								hover:shadow-[0_0_30px_rgba(0,217,255,0.2)]"
              style="animation: slideInUp 0.8s cubic-bezier(0.16, 1, 0.3, 1) {0.2 + i * 0.1}s both"
            >
              <!-- Glow effect -->
              <div
                class="pointer-events-none absolute inset-0 bg-gradient-to-br from-[var(--accent-cyan)]/0 via-[var(--accent-purple)]/0
								to-[var(--accent-pink)]/0 transition-all duration-500
								group-hover:from-[var(--accent-cyan)]/5 group-hover:via-[var(--accent-purple)]/5 group-hover:to-[var(--accent-pink)]/5"
              ></div>

              <div class="relative z-10 space-y-4">
                <div class="flex items-center gap-3">
                  <h3
                    class="text-2xl font-bold text-[var(--text-primary)] transition-colors duration-300 group-hover:text-[var(--accent-cyan)]"
                  >
                    {work.title}
                  </h3>
                  <span
                    class="rounded px-2 py-0.5 font-mono text-xs {work.type === 'team'
                      ? 'border border-[var(--accent-pink)]/30 bg-[var(--accent-pink)]/10 text-[var(--accent-pink)]'
                      : 'border border-[var(--accent-cyan)]/30 bg-[var(--accent-cyan)]/10 text-[var(--accent-cyan)]'}"
                  >
                    {work.type}
                  </span>
                  <!-- Links -->
                  {#if work.links.github}
                    <a
                      href={work.links.github}
                      target="_blank"
                      rel="noopener noreferrer"
                      class="text-[var(--text-secondary)] transition-colors hover:text-[var(--accent-cyan)]"
                      title="GitHub"
                    >
                      <Icon icon="mdi:github" class="h-5 w-5" />
                    </a>
                  {/if}
                  {#if work.links.website}
                    <a
                      href={work.links.website}
                      target="_blank"
                      rel="noopener noreferrer"
                      class="text-[var(--text-secondary)] transition-colors hover:text-[var(--accent-purple)]"
                      title="Website"
                    >
                      <Icon icon="mdi:open-in-new" class="h-5 w-5" />
                    </a>
                  {/if}
                  {#if work.links.article}
                    <a
                      href={work.links.article}
                      target="_blank"
                      rel="noopener noreferrer"
                      class="text-[var(--text-secondary)] transition-colors hover:text-[var(--accent-pink)]"
                      title="Article"
                    >
                      <Icon icon="mdi:file-document" class="h-5 w-5" />
                    </a>
                  {/if}
                </div>
                <p class="leading-relaxed text-[var(--text-secondary)]">
                  {work.description}
                </p>

                <!-- Tags -->
                <div class="flex flex-wrap gap-2">
                  {#each work.tags as tag}
                    <span
                      class="flex items-center gap-1 rounded bg-[var(--text-secondary)]/5 px-2 py-0.5 font-mono text-xs text-[var(--text-secondary)]"
                    >
                      <Icon icon={tagIcons[tag]} class="h-3.5 w-3.5" />
                      {tag}
                    </span>
                  {/each}
                </div>
              </div>
            </article>
          {/each}
        </div>
      </section>
    {/if}

    <!-- Archived Projects -->
    {#if archivedWorks.length > 0}
      <section>
        <h2
          class="mb-8 flex items-center gap-2 font-mono text-2xl font-bold text-[var(--accent-purple)]"
        >
          <span class="text-[var(--accent-cyan)]">{">"}</span>
          Archived
        </h2>
        <div class="grid gap-4 md:grid-cols-3">
          {#each archivedWorks as work, i}
            <article
              class="group overflow-hidden rounded-lg border border-[var(--accent-purple)]/20 bg-[var(--bg-dark)]/30 backdrop-blur-sm
								transition-all duration-300 hover:border-[var(--accent-purple)]/60 hover:shadow-[0_0_20px_rgba(181,128,255,0.15)]"
              style="animation: slideInUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) {0.4 + i * 0.08}s both"
            >
              {#if work.screenshot}
                <div class="aspect-[5/3] overflow-hidden bg-[var(--bg-dark)]">
                  <img
                    src={work.screenshot}
                    alt="{work.title} screenshot"
                    class="h-full w-full object-cover opacity-70 transition-opacity duration-300 group-hover:opacity-100"
                  />
                </div>
              {/if}
              <div class="space-y-3 p-5">
                <div class="flex items-center gap-2">
                  <h3
                    class="text-xl font-bold text-[var(--text-primary)] transition-colors group-hover:text-[var(--accent-purple)]"
                  >
                    {work.title}
                  </h3>
                  <span
                    class="rounded px-1.5 py-0.5 font-mono text-[10px] {work.type === 'team'
                      ? 'border border-[var(--accent-pink)]/30 bg-[var(--accent-pink)]/10 text-[var(--accent-pink)]'
                      : 'border border-[var(--accent-cyan)]/30 bg-[var(--accent-cyan)]/10 text-[var(--accent-cyan)]'}"
                  >
                    {work.type}
                  </span>
                  {#if work.links.github}
                    <a
                      href={work.links.github}
                      target="_blank"
                      rel="noopener noreferrer"
                      class="text-[var(--text-secondary)] transition-colors hover:text-[var(--accent-cyan)]"
                      title="GitHub"
                    >
                      <Icon icon="mdi:github" class="h-4 w-4" />
                    </a>
                  {/if}
                  {#if work.links.website}
                    <a
                      href={work.links.website}
                      target="_blank"
                      rel="noopener noreferrer"
                      class="text-[var(--text-secondary)] transition-colors hover:text-[var(--accent-purple)]"
                      title="Website"
                    >
                      <Icon icon="mdi:open-in-new" class="h-4 w-4" />
                    </a>
                  {/if}
                </div>
                <p class="text-sm leading-relaxed text-[var(--text-secondary)]">
                  {work.description}
                </p>

                <div class="flex flex-wrap gap-2">
                  {#each work.tags as tag}
                    <span
                      class="flex items-center gap-1 rounded bg-[var(--text-secondary)]/5 px-1.5 py-0.5 font-mono text-[10px] text-[var(--text-secondary)]"
                    >
                      <Icon icon={tagIcons[tag]} class="h-3 w-3" />
                      {tag}
                    </span>
                  {/each}
                </div>
              </div>
            </article>
          {/each}
        </div>
      </section>
    {/if}
  </div>
</div>
