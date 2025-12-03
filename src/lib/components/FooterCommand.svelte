<section
	class="pt-16 font-mono text-sm text-[var(--text-secondary)]"
	style="animation: slideInUp 0.8s ease-out 0.6s backwards"
>
	<p>
		$ {[
			'bun run build --mode=production',
			'nix build .#default --show-trace',
			'cargo build --release'
		][Math.floor(Math.random() * 3)]}
	</p>
</section>
