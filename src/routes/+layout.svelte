<script lang="ts">
	import Head from '@/services/app/components/Head.svelte';
	import '../app.css';
	import type { Snippet } from 'svelte';

	interface Props {
		children: Snippet;
	}
	const { children }: Props = $props();
</script>

<Head />

{@render children?.()}
