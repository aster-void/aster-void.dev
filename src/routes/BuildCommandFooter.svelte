<script lang="ts">
	let { command }: { command: string } = $props();
</script>

<section
	class="pt-16 font-mono text-sm text-[var(--text-secondary)]"
	style="animation: slideInUp 0.8s ease-out 0.6s backwards"
>
	<p>$ {command}</p>
</section>
