<script lang="ts">
	import Icon from '@iconify/svelte';

	type Accent = 'cyan' | 'purple' | 'pink';

	export type LinkSpec = {
		href: string;
		label: string;
		variant: Accent;
		rel?: string;
		target?: string;
		icon: 'github' | 'zenn' | 'works';
	};

	let { links, visible = false }: { links: LinkSpec[]; visible?: boolean } = $props();

	const borderClass = (variant: Accent) => {
		switch (variant) {
			case 'cyan':
				return 'border-[var(--accent-cyan)] hover:shadow-[0_0_30px_rgba(0,217,255,0.5)]';
			case 'purple':
				return 'border-[var(--accent-purple)] hover:shadow-[0_0_30px_rgba(181,128,255,0.5)]';
			case 'pink':
				return 'border-[var(--accent-pink)] hover:shadow-[0_0_30px_rgba(255,110,199,0.5)]';
		}
	};

	const gradientClass = (variant: Accent) => {
		switch (variant) {
			case 'cyan':
				return 'from-[var(--accent-cyan)]';
			case 'purple':
				return 'from-[var(--accent-purple)]';
			case 'pink':
				return 'from-[var(--accent-pink)]';
		}
	};

	const textClass = (variant: Accent) => {
		switch (variant) {
			case 'cyan':
				return 'text-[var(--accent-cyan)]';
			case 'purple':
				return 'text-[var(--accent-purple)]';
			case 'pink':
				return 'text-[var(--accent-pink)]';
		}
	};
</script>

<section
	class="flex flex-col items-center justify-center gap-4 pt-8 sm:flex-row"
	class:invisible={!visible}
	style={visible ? 'animation: slideInUp 0.8s ease-out' : ''}
>
	{#each links as link}
		<a
			href={link.href}
			target={link.target}
			rel={link.rel}
			class={`group relative w-full overflow-hidden rounded-lg border-2 bg-[var(--bg-dark)] px-8 py-4 transition-all duration-300 hover:scale-105 sm:w-auto ${borderClass(
				link.variant
			)}`}
			aria-label={link.label}
		>
			<div
				class={`absolute inset-0 bg-gradient-to-r ${gradientClass(
					link.variant
				)} to-transparent opacity-0 transition-opacity duration-300 group-hover:opacity-20`}
			></div>
			<span
				class={`relative flex items-center justify-center gap-2 font-mono text-lg ${textClass(link.variant)}`}
			>
				{#if link.icon === 'works'}
					<Icon icon="lucide:folder" class="h-6 w-6" />
				{:else if link.icon === 'github'}
					<Icon icon="mdi:github" class="h-6 w-6" />
				{:else if link.icon === 'zenn'}
					<Icon icon="simple-icons:zenn" class="h-6 w-6" />
				{/if}
				{link.label}
			</span>
		</a>
	{/each}
</section>
