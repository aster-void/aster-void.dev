<script lang="ts">
	import Icon from '@iconify/svelte';
	import { page } from '$app/stores';

	const links = [
		{ href: '/', label: 'Home' },
		{ href: '/works', label: 'Works' }
	];
</script>

<nav
	class="fixed top-0 right-0 left-0 z-50 border-b border-[var(--accent-cyan)]/20 bg-[var(--bg-darker)]/80 backdrop-blur-sm"
	style="view-transition-name: nav;"
>
	<div class="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8">
		<div class="flex h-16 items-center justify-between">
			<div class="flex items-center">
				<a
					href="/"
					class="font-mono text-base leading-none text-[var(--accent-purple)] transition-opacity hover:opacity-80"
				>
					aster@aster-void.dev
				</a>
				<span class="font-mono text-base leading-none text-[var(--accent-cyan)]">&nbsp;$</span>
			</div>

			<div class="flex items-center space-x-1">
				{#each links as link}
					<a
						href={link.href}
						class="rounded-lg px-4 py-2 font-mono text-sm transition-all duration-300
							{$page.url.pathname === link.href
							? 'bg-[var(--accent-cyan)]/20 text-[var(--accent-cyan)] shadow-[0_0_15px_rgba(0,217,255,0.3)]'
							: 'text-[var(--text-secondary)] hover:bg-[var(--accent-cyan)]/10 hover:text-[var(--accent-cyan)]'}"
					>
						{link.label}
					</a>
				{/each}
				<a
					href="https://github.com/aster-void/aster-void.dev"
					target="_blank"
					rel="noopener noreferrer"
					class="ml-2 rounded-lg p-2 text-[var(--text-secondary)] transition-all duration-300 hover:bg-[var(--accent-cyan)]/10 hover:text-[var(--accent-cyan)]"
					aria-label="View source on GitHub"
				>
					<Icon icon="mdi:github" class="h-5 w-5" />
				</a>
			</div>
		</div>
	</div>
</nav>

<style>
	nav {
		animation: slideDown 0.6s cubic-bezier(0.16, 1, 0.3, 1);
	}

	@keyframes slideDown {
		from {
			opacity: 0;
			transform: translateY(-20px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}
</style>
