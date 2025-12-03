<script lang="ts">
	type Accent = 'cyan' | 'purple';

	type LinkSpec = {
		href: string;
		label: string;
		variant: Accent;
		rel?: string;
		target?: string;
		icon: 'github' | 'zenn';
	};

	const links: LinkSpec[] = [
		{
			href: 'https://github.com/aster-void',
			label: 'GitHub',
			variant: 'cyan',
			rel: 'noopener noreferrer',
			target: '_blank',
			icon: 'github'
		},
		{
			href: 'https://zenn.dev/aster_void',
			label: 'Zenn',
			variant: 'purple',
			rel: 'noopener noreferrer',
			target: '_blank',
			icon: 'zenn'
		}
	];

	const borderClass = (variant: Accent) =>
		variant === 'cyan'
			? 'border-[var(--accent-cyan)] hover:shadow-[0_0_30px_rgba(0,217,255,0.5)]'
			: 'border-[var(--accent-purple)] hover:shadow-[0_0_30px_rgba(181,128,255,0.5)]';

	const gradientClass = (variant: Accent) =>
		variant === 'cyan' ? 'from-[var(--accent-cyan)]' : 'from-[var(--accent-purple)]';

	const textClass = (variant: Accent) =>
		variant === 'cyan' ? 'text-[var(--accent-cyan)]' : 'text-[var(--accent-purple)]';
</script>

<section
	class="flex flex-col items-center justify-center gap-4 pt-8 sm:flex-row"
	style="animation: slideInUp 0.8s ease-out 0.4s backwards"
>
	{#each links as link}
		<a
			href={link.href}
			target={link.target}
			rel={link.rel}
			class={`group relative w-full overflow-hidden rounded-lg border-2 bg-[var(--bg-dark)] px-8 py-4 transition-all duration-300 hover:scale-105 sm:w-auto ${borderClass(
				link.variant
			)}`}
		>
			<div
				class={`absolute inset-0 bg-gradient-to-r ${gradientClass(
					link.variant
				)} to-transparent opacity-0 transition-opacity duration-300 group-hover:opacity-20`}
			></div>
			<span
				class={`relative flex items-center justify-center gap-2 font-mono text-lg ${textClass(link.variant)}`}
			>
				{#if link.icon === 'github'}
					<svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
						<path
							d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"
						/>
					</svg>
				{:else if link.icon === 'zenn'}
					<svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
						<path d="M.264 1.486h23.472v21.028H.264z" />
						<path
							fill="var(--bg-darker)"
							d="M14.943 11.486L9.257 1.743h5.686l5.686 9.743-5.686 9.742H9.257z"
						/>
					</svg>
				{/if}
				{link.label}
			</span>
		</a>
	{/each}
</section>
