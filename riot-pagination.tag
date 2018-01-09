<riot-pagination>

	<div class="ui pagination menu">
		<a
			if      = "{ showFirst }"
			onclick = "{ goFirst() }"
			class   = "item { currentPage == 1 && 'disabled' }">
			{ firstText }
		</a>
		<a
			if      = "{ showPrev }"
			onclick = "{ goPrev() }"
			class   = "item { currentPage == 1 && 'disabled' }">
			{ prevText }
		</a>
		<a
			each    = "{ page in pages }"
			onclick = "{ goToPage() }"
			class   = "item { page == currentPage && 'active green' }">
			{ page }
		</a>
		<a
			if      = "{ showNext }"
			onclick = "{ goNext() }"
			class   = "item { currentPage == pageCount && 'disabled' }">
			{ nextText }
		</a>
		<a
			if      = "{ showLast }"
			onclick = "{ goLast() }"
			class   = "item { currentPage == pageCount && 'disabled' }">
			{ lastText }
		</a>
	</div>

	<script>

		assignOpts() {

			this.currentPage = parseInt(this.opts.currentPage) || 1;
			this.maxButtons  = parseInt(this.opts.maxButtons) || 8;
			this.pageCount   = parseInt(this.opts.pageCount);
			this.recordCount = parseInt(this.opts.recordCount);
			this.perPage     = parseInt(this.opts.perPage) || 10;

			this.firstText   = this.opts.firstText ? String(this.opts.firstText) : "First";
			this.lastText    = this.opts.lastText ? String(this.opts.lastText) : "Last";
			this.nextText    = this.opts.nextText ? String(this.opts.nextText) : "Next";
			this.prevText    = this.opts.prevText ? String(this.opts.prevText) : "Previous";

			this.pageChanged = this.opts.pageChanged;

			this.showFirst   = (String(this.opts.showFirst) == "true") || true;
			this.showLast    = (String(this.opts.showLast) == "true") || true;
			this.showNext    = (String(this.opts.showNext) == "true") || true;
			this.showPrev    = (String(this.opts.showPrev) == "true") || true;

			this.pages       = [];
		}

		goFirst(e) {
			return(e) => {
				if (this.currentPage > 1) {
					this.switchPage(1);
				}
			}
		}

		goPrev(e) {
			return(e) => {
				if (this.currentPage > 1) {
					this.switchPage(this.currentPage - 1);
				}
			}
		}

		goNext(e) {
			return(e) => {
				if (this.currentPage < this.pageCount) {
					this.switchPage(this.currentPage + 1);
				}
			}
		}

		goLast(e) {
			return(e) => {
				if (this.currentPage < this.pageCount) {
					this.switchPage(this.pageCount);
				}
			}
		}

		goToPage(e) {
			return(e) => {
				if (this.currentPage != e.item.page) {
					this.switchPage(e.item.page);
				}
			}
		}

		switchPage(pageNo) {
			if (this.pageChanged) {
				try {
					this.pageChanged(pageNo);
				} catch(e) {
					// statements
					console.log(e);
				}
			}
		}

		updatePages() {
			this.pages     = [];
			let maxButtons = this.maxButtons < 3 ? 3 : this.maxButtons;
			let minPos     = (maxButtons % 2) == 1 ? ((maxButtons - 1) / 2) : ((maxButtons / 2) - 1);
			let rightPos   = maxButtons - (minPos + 1);

			if (this.currentPage > 1) {
				let initVal;
				if (this.currentPage <= (minPos + 1)) {
					initVal = 1;
				}
				else if (this.currentPage > (this.pageCount - rightPos)) {
					let diff = this.currentPage - (this.pageCount - rightPos);
					initVal = this.currentPage - (minPos + diff);
				}
				else {
					initVal = this.currentPage - minPos;
				}
				
				if (initVal <= 0) { initVal = 1; }

				for (let i = initVal; i < this.currentPage; i++) {
					this.pages.push(i);
				}
			}

			// Push the current page
			this.pages.push(this.currentPage);

			if (this.currentPage < this.pageCount) {
				for (let i = this.currentPage; i < this.pageCount; i++) {
					this.pages.push(i + 1);

					if (this.pages.length == maxButtons) {
						break;
					}
				}
			}

			this.update();
		}

		this.on('refresh', (e) => {
			this.assignOpts();
			this.updatePages();
		});

	</script>
</riot-pagination>

