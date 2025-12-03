<script lang="ts">
	import AboutSummary from './AboutSummary.svelte';
	import BuildCommandFooter from './BuildCommandFooter.svelte';
	import GridOverlay from './GridOverlay.svelte';
	import HeroBanner from './HeroBanner.svelte';
	import PageShell from './PageShell.svelte';
	import ProfileButtons, { type LinkSpec } from './ProfileButtons.svelte';

	const profileLinks: LinkSpec[] = [
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

	const buildCommands = [
		'bun run build --mode=production',
		'nix build .#default --show-trace',
		'cargo build --release'
	];

	const buildCommand = buildCommands[Math.floor(Math.random() * buildCommands.length)];
</script>

<GridOverlay />

<PageShell>
	<div class="space-y-8 text-center">
		<HeroBanner />
		<AboutSummary />
		<ProfileButtons links={profileLinks} />
		<BuildCommandFooter command={buildCommand} />
	</div>
</PageShell>
