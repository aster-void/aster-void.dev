<script lang="ts">
	import GridOverlay from '../GridOverlay.svelte';
	import Navigation from '../Navigation.svelte';

	type WorkType = 'personal' | 'team';

	interface Work {
		title: string;
		description: string;
		tags: string[];
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
		// Featured (personal)
		{
			title: 'nix-hazkey',
			description:
				'NixOSでHazkey日本語入力を使えるようにするパッケージ。fcitx5-hazkeyをNix向けにパッケージ化。',
			tags: ['Nix', 'IME', 'Japanese'],
			links: {
				github: 'https://github.com/aster-void/nix-hazkey'
			},
			type: 'personal'
		},
		{
			title: 'climcp',
			description: 'MCPサーバーをターミナルから直接操作できるCLIツール。',
			tags: ['TypeScript', 'Bun', 'CLI', 'MCP'],
			links: {
				github: 'https://github.com/aster-void/climcp',
				website: 'https://www.npmjs.com/package/climcp'
			},
			type: 'personal'
		},
		// Archived (team)
		{
			title: 'CourseMate',
			description: '同じ授業を履修している友達を見つけられるアプリ。大学生活をもっと楽しく。',
			tags: ['Mobile', 'Social', 'Education'],
			links: {},
			screenshot: '/screenshots/placeholder.svg',
			type: 'team',
			archived: true
		},
		{
			title: 'Habit Relay',
			description: 'チームで習慣を継続するためのアプリ。リレー形式でモチベーションを維持。',
			tags: ['Mobile', 'Productivity'],
			links: {},
			screenshot: '/screenshots/placeholder.svg',
			type: 'team',
			archived: true
		},
		{
			title: 'ut-bridge',
			description: '大学生向けのコミュニケーションプラットフォーム。',
			tags: ['Web', 'Social', 'Education'],
			links: {},
			screenshot: '/screenshots/placeholder.svg',
			type: 'team',
			archived: true
		},
		{
			title: 'how-match',
			description: 'マッチングの仕組みを可視化するアプリ。',
			tags: ['Web', 'Visualization'],
			links: {},
			screenshot: '/screenshots/placeholder.svg',
			type: 'team',
			archived: true
		},
		{
			title: 'uplace',
			description: '場所ベースのソーシャルアプリ。',
			tags: ['Mobile', 'Social', 'Location'],
			links: {},
			screenshot: '/screenshots/placeholder.svg',
			type: 'team',
			archived: true
		},
		// Archived (personal)
		{
			title: 'ai-othello',
			description: 'ブラウザ上でAIと対戦できるオセロゲーム。WebAssemblyで動作。',
			tags: ['Rust', 'WASM', 'Game'],
			links: {},
			screenshot: '/screenshots/placeholder.svg',
			type: 'personal',
			archived: true
		}
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
					<span class="text-[var(--accent-purple)]">{'>'}</span>
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
								</div>
								<p class="leading-relaxed text-[var(--text-secondary)]">
									{work.description}
								</p>

								<!-- Tags -->
								<div class="flex flex-wrap gap-2">
									{#each work.tags as tag}
										<span
											class="rounded bg-[var(--text-secondary)]/5 px-2 py-0.5 font-mono text-xs text-[var(--text-secondary)]"
										>
											{tag}
										</span>
									{/each}
								</div>

								<!-- Links -->
								<div class="flex gap-3 pt-2">
									{#if work.links.github}
										<a
											href={work.links.github}
											target="_blank"
											rel="noopener noreferrer"
											class="rounded-lg border border-[var(--accent-cyan)]/30 bg-[var(--accent-cyan)]/10 px-4 py-2 font-mono
												text-sm text-[var(--accent-cyan)] transition-all duration-300
												hover:border-[var(--accent-cyan)]/60 hover:bg-[var(--accent-cyan)]/20 hover:shadow-[0_0_15px_rgba(0,217,255,0.3)]"
										>
											GitHub
										</a>
									{/if}
									{#if work.links.website}
										<a
											href={work.links.website}
											target="_blank"
											rel="noopener noreferrer"
											class="rounded-lg border border-[var(--accent-purple)]/30 bg-[var(--accent-purple)]/10 px-4 py-2 font-mono
												text-sm text-[var(--accent-purple)] transition-all duration-300
												hover:border-[var(--accent-purple)]/60 hover:bg-[var(--accent-purple)]/20 hover:shadow-[0_0_15px_rgba(181,128,255,0.3)]"
										>
											Website
										</a>
									{/if}
									{#if work.links.article}
										<a
											href={work.links.article}
											target="_blank"
											rel="noopener noreferrer"
											class="rounded-lg border border-[var(--accent-pink)]/30 bg-[var(--accent-pink)]/10 px-4 py-2 font-mono
												text-sm text-[var(--accent-pink)] transition-all duration-300
												hover:border-[var(--accent-pink)]/60 hover:bg-[var(--accent-pink)]/20 hover:shadow-[0_0_15px_rgba(255,110,199,0.3)]"
										>
											Article
										</a>
									{/if}
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
					<span class="text-[var(--accent-cyan)]">{'>'}</span>
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
								</div>
								<p class="text-sm leading-relaxed text-[var(--text-secondary)]">
									{work.description}
								</p>

								<div class="flex flex-wrap gap-2">
									{#each work.tags as tag}
										<span
											class="rounded bg-[var(--text-secondary)]/5 px-2 py-0.5 font-mono text-xs text-[var(--text-secondary)]"
										>
											{tag}
										</span>
									{/each}
								</div>

								{#if work.links.github || work.links.website}
									<div class="flex gap-2 pt-1">
										{#if work.links.github}
											<a
												href={work.links.github}
												target="_blank"
												rel="noopener noreferrer"
												class="rounded border border-[var(--accent-cyan)]/30 bg-[var(--accent-cyan)]/10 px-3 py-1.5 font-mono
													text-xs text-[var(--accent-cyan)] transition-all duration-300 hover:bg-[var(--accent-cyan)]/20"
											>
												GitHub
											</a>
										{/if}
										{#if work.links.website}
											<a
												href={work.links.website}
												target="_blank"
												rel="noopener noreferrer"
												class="rounded border border-[var(--accent-purple)]/30 bg-[var(--accent-purple)]/10 px-3 py-1.5 font-mono
													text-xs text-[var(--accent-purple)] transition-all duration-300 hover:bg-[var(--accent-purple)]/20"
											>
												Website
											</a>
										{/if}
									</div>
								{/if}
							</div>
						</article>
					{/each}
				</div>
			</section>
		{/if}
	</div>
</div>
