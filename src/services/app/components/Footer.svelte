<script lang="ts">
	const contact = [
		{
			text: 'GitHub',
			href: 'https://github.com/aster-void'
		},
		{
			text: 'Website',
			href: 'https://github.com/aster-void'
		}
	];

	interface Props {
		class?: string;
	}
	const { class: className }: Props = $props();
</script>

<footer class={['footer bg-neutral p-10 text-neutral-content sm:footer-horizontal', className]}>
	<nav>
		<h6 class="footer-title">Contact</h6>
		{#each contact as link (link.href)}
			<a rel="noreferrer" target="_blank" href={link.href} class="link link-hover">
				{link.text}
			</a>
		{/each}
	</nav>
</footer>
