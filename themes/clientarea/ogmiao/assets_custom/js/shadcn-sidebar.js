/* ================================================================
 * shadcn/ui Sidebar - Vanilla JS Implementation
 * Equivalent to the React useSidebar() hook + SidebarProvider
 *
 * Public API (window.Sidebar):
 *   Sidebar.getState()                -> { state, open, isMobile }
 *   Sidebar.toggle()                  -> toggle collapsed
 *   Sidebar.setState(state)           -> 'expanded' | 'collapsed'
 *   Sidebar.openMobile()
 *   Sidebar.closeMobile()
 *   Sidebar.toggleMobile()
 *
 * Behavior:
 *   - Persists collapsed state in localStorage (key: 'sh_sidebar_state')
 *   - Keyboard shortcut: Ctrl/Cmd + B to toggle
 *   - Mobile (< 992px): drawer with backdrop, swipe to close
 *   - Auto-activates menu items based on current URL
 *   - Collapsible: clicking expand state for submenus
 *   - Search filter (top-level menu only)
 *
 * No external dependencies (uses native JS + jQuery if available)
 * ================================================================ */

(function (root, factory) {
  'use strict';
  if (typeof define === 'function' && define.amd) {
    define([], function () { return factory(root); });
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(root);
  } else {
    root.Sidebar = factory(root);
  }
})(typeof window !== 'undefined' ? window : this, function (root) {
  'use strict';

  /* ---------------- Constants ---------------- */
  var STORAGE_KEY = 'sh_sidebar_state';      // 'expanded' | 'collapsed'
  var MOBILE_BP = 991.98;                    // match CSS media query
  var KEY_SHORTCUT = 'b';                    // Cmd/Ctrl + KEY_SHORTCUT
  var COLLAPSE_DURATION = 200;               // ms, match CSS

  /* ---------------- State ---------------- */
  var _state = {
    state: readStoredState(),      // 'expanded' | 'collapsed'
    openMobile: false,
    isMobile: false,
  };

  var $ = root.jQuery || null;
  var _dom = {
    root: null,
    backdrop: null,
    toggle: null,
    search: null,
  };

  /* ---------------- Utilities ---------------- */
  function readStoredState() {
    try {
      var v = root.localStorage && root.localStorage.getItem(STORAGE_KEY);
      return v === 'collapsed' ? 'collapsed' : 'expanded';
    } catch (e) {
      return 'expanded';
    }
  }

  function writeStoredState(state) {
    try {
      if (root.localStorage) {
        root.localStorage.setItem(STORAGE_KEY, state);
      }
    } catch (e) { /* ignore */ }
  }

  function isMobileWidth() {
    return root.window ? root.window.innerWidth <= MOBILE_BP : false;
  }

  function setRootAttr(name, value) {
    if (_dom.root) _dom.root.setAttribute(name, value);
  }

  function emitChange() {
    if ($ && $.event) {
      $._data && $._data(root.document, 'events'); // ensure jQuery cache
      try { $(root.document).trigger('sidebar:change', [_state]); } catch (e) {}
    }
    var evt;
    try {
      evt = new root.CustomEvent('sidebar:change', { detail: _state });
      root.document.dispatchEvent(evt);
    } catch (e) { /* old browser */ }
  }

  /* ---------------- Public API ---------------- */
  function getState() {
    return Object.assign({}, _state);
  }

  function setState(state) {
    state = state === 'collapsed' ? 'collapsed' : 'expanded';
    if (_state.state === state) return;
    _state.state = state;
    setRootAttr('data-state', state);
    writeStoredState(state);
    if (root.document && root.document.body) {
      root.document.body.classList.toggle('sidebar-collapsed', state === 'collapsed');
    }
    emitChange();
  }

  function toggle() {
    setState(_state.state === 'expanded' ? 'collapsed' : 'expanded');
  }

  function openMobile() {
    if (!_state.isMobile) return;
    _state.openMobile = true;
    setRootAttr('data-mobile-state', 'open');
    if (_dom.backdrop) _dom.backdrop.classList.add('is-open');
    root.document.body.classList.add('sidebar-enable');
    root.document.body.style.overflow = 'hidden';
  }

  function closeMobile() {
    if (!_state.isMobile) return;
    _state.openMobile = false;
    setRootAttr('data-mobile-state', 'closed');
    if (_dom.backdrop) _dom.backdrop.classList.remove('is-open');
    root.document.body.classList.remove('sidebar-enable');
    root.document.body.style.overflow = '';
  }

  function toggleMobile() {
    if (_state.openMobile) closeMobile();
    else openMobile();
  }

  /* ---------------- Init ---------------- */
  function init(opts) {
    opts = opts || {};
    _dom.root = opts.root || root.document.querySelector('.sh-sidebar') || root.document.querySelector('.og-sidebar');
    if (!_dom.root) return false;

    _dom.backdrop = opts.backdrop || root.document.querySelector('.sh-sidebar-backdrop');
    if (!_dom.backdrop && _dom.root.classList.contains('og-sidebar')) {
      _dom.backdrop = root.document.createElement('div');
      _dom.backdrop.className = 'sh-sidebar-backdrop og-sidebar-backdrop';
      root.document.body.appendChild(_dom.backdrop);
    }
    _dom.toggle = opts.toggle || root.document.querySelector('#shSidebarToggle') || root.document.querySelector('#vertical-menu-btn');
    _dom.search = opts.search || root.document.querySelector('#shSidebarSearch');

    // Apply initial state
    setRootAttr('data-state', _state.state);
    setRootAttr('data-mobile-state', 'closed');

    // Mobile state on init
    _state.isMobile = isMobileWidth();
    setRootAttr('data-variant', _dom.root.getAttribute('data-variant') || 'sidebar');
    setRootAttr('data-side', _dom.root.getAttribute('data-side') || 'left');

    // ---- Event bindings ----
    bindToggle();
    bindBackdrop();
    bindKeyboard();
    bindResize();
    bindSubmenuToggle();
    bindMenuActive();
    bindSearch();
    bindUserDropdown();
    bindSwipeToClose();

    return true;
  }

  function bindToggle() {
    if (_dom.toggle) {
      _dom.toggle.addEventListener('click', function (e) {
        e.preventDefault();
        if (_state.isMobile) {
          toggleMobile();
        } else {
          toggle();
        }
      });
    }
  }

  function bindBackdrop() {
    if (_dom.backdrop) {
      _dom.backdrop.addEventListener('click', closeMobile);
    }
  }

  function bindKeyboard() {
    if (!root.document) return;
    root.document.addEventListener('keydown', function (e) {
      var key = (e.key || '').toLowerCase();
      var modKey = root.navigator && root.navigator.platform.indexOf('Mac') > -1
        ? e.metaKey
        : e.ctrlKey;
      if (modKey && key === KEY_SHORTCUT) {
        e.preventDefault();
        if (_state.isMobile) toggleMobile();
        else toggle();
      }
      // Esc to close mobile
      if (key === 'escape' && _state.isMobile && _state.openMobile) {
        closeMobile();
      }
    });
  }

  function bindResize() {
    if (!root.window) return;
    var raf = null;
    root.window.addEventListener('resize', function () {
      if (raf) return;
      raf = root.requestAnimationFrame(function () {
        raf = null;
        var wasMobile = _state.isMobile;
        _state.isMobile = isMobileWidth();
        if (!wasMobile && _state.isMobile) {
          // switched to mobile: close mobile drawer by default
          closeMobile();
        }
        if (wasMobile && !_state.isMobile) {
          closeMobile();
          // Restore the desktop state on root element
          setRootAttr('data-state', _state.state);
        }
      });
    });
  }

  function bindSubmenuToggle() {
    if (!_dom.root) return;
    _dom.root.addEventListener('click', function (e) {
      var btn = e.target.closest('.sh-sidebar-menu-button.has-arrow, .sh-sidebar-menu-sub-button.has-arrow, .og-sidebar-link.has-arrow');
      if (!btn) return;
      // Only intercept if it is a "has-arrow" toggle (i.e., href is # or empty)
      var href = btn.getAttribute('href') || '';
      if (href !== '' && href !== '#' && !href.endsWith('#') && href.indexOf('javascript') !== 0) return;

      e.preventDefault();
      var item = btn.closest('.sh-sidebar-menu-item, .sh-sidebar-menu-sub-item, .og-sidebar-item');
      if (!item) return;
      var open = item.getAttribute('data-state') === 'open';
      // Sibling collapse
      var parent = item.parentElement;
      if (parent) {
        Array.prototype.forEach.call(parent.children, function (sib) {
          if (sib !== item && sib.classList && (sib.classList.contains('sh-sidebar-menu-item') || sib.classList.contains('sh-sidebar-menu-sub-item') || sib.classList.contains('og-sidebar-item'))) {
            sib.setAttribute('data-state', 'closed');
            sib.querySelectorAll('[data-state="open"]').forEach(function (sub) {
              sub.setAttribute('data-state', 'closed');
            });
          }
        });
      }
      item.setAttribute('data-state', open ? 'closed' : 'open');
      btn.setAttribute('aria-expanded', open ? 'false' : 'true');
    });
  }

  function bindMenuActive() {
    if (!_dom.root || !root.location) return;
    var path = root.location.pathname;
    var hash = root.location.hash;
    var search = root.location.search;
    var fullHref = root.location.href;
    var links = _dom.root.querySelectorAll('.sh-sidebar-menu-button, .sh-sidebar-menu-sub-button, .og-sidebar-link');
    Array.prototype.forEach.call(links, function (a) {
      if (a.classList.contains('has-arrow')) return;
      var href = a.getAttribute('href') || '';
      if (!href || href === '#') return;
      var matches = false;
      try {
        var u = new root.URL(href, root.location.origin);
        if (u.origin !== root.location.origin) return;
        if (u.pathname === path) {
          // Match also considers search/hash if present on both
          if (u.search === search || (search && u.search && u.search.indexOf(search.replace(/^\?/, '')) !== -1)) {
            matches = true;
          } else if (!u.search && !search) {
            matches = true;
          } else if (path.indexOf(u.pathname) === 0 && u.pathname !== '/') {
            matches = true;
          }
        } else if (path.indexOf(u.pathname) === 0 && u.pathname !== '/' && u.pathname.length > 1) {
          matches = true;
        }
      } catch (e) { /* ignore */ }

      if (matches) {
        a.classList.add('is-active');
        var item = a.closest('.sh-sidebar-menu-item, .sh-sidebar-menu-sub-item, .og-sidebar-item');
        if (item) {
          item.setAttribute('data-active', 'true');
          item.classList.add('mm-active');
          // Expand parent submenus
          var parent = item.parentElement;
          while (parent && parent !== _dom.root) {
            if (parent.classList && (parent.classList.contains('sh-sidebar-menu-item') || parent.classList.contains('sh-sidebar-menu-sub-item') || parent.classList.contains('og-sidebar-item'))) {
              parent.setAttribute('data-state', 'open');
              parent.classList.add('mm-active');
              var btn = parent.querySelector(':scope > .sh-sidebar-menu-button, :scope > .sh-sidebar-menu-sub-button, :scope > .og-sidebar-link');
              if (btn) btn.setAttribute('aria-expanded', 'true');
            }
            parent = parent.parentElement;
          }
        }
      }
    });
  }

  function bindSearch() {
    if (!_dom.search) return;
    var items = _dom.root ? _dom.root.querySelectorAll('.sh-sidebar-menu-item') : [];
    _dom.search.addEventListener('input', function (e) {
      var q = (e.target.value || '').trim().toLowerCase();
      Array.prototype.forEach.call(items, function (item) {
        var label = item.querySelector(':scope > .sh-sidebar-menu-button > .sh-sidebar-menu-label');
        if (!label) {
          item.style.display = '';
          return;
        }
        var text = (label.textContent || '').toLowerCase();
        var match = q === '' || text.indexOf(q) !== -1;
        item.style.display = match ? '' : 'none';
      });
    });
  }

  function bindUserDropdown() {
    if (!_dom.root) return;
    // The dropdown is rendered as part of the template; we just attach hover/focus
    // behavior to mimic shadcn DropdownMenu. Bootstrap's dropdown js is also used if
    // available; here we provide a minimal vanilla implementation.
    var trigger = _dom.root.querySelector('#sidebar-user-dropdown');
    var menu = _dom.root.querySelector('.sh-sidebar-dropdown-menu');
    if (!trigger || !menu) return;

    function openMenu() {
      menu.classList.add('show');
      menu.setAttribute('data-state', 'open');
      trigger.setAttribute('aria-expanded', 'true');
    }
    function closeMenu() {
      menu.classList.remove('show');
      menu.setAttribute('data-state', 'closed');
      trigger.setAttribute('aria-expanded', 'false');
    }
    function toggleMenu() {
      if (menu.classList.contains('show')) closeMenu();
      else openMenu();
    }

    trigger.addEventListener('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      toggleMenu();
    });
    trigger.addEventListener('keydown', function (e) {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        toggleMenu();
      }
    });
    root.document.addEventListener('click', function (e) {
      if (!menu.contains(e.target) && !trigger.contains(e.target)) closeMenu();
    });
    root.document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') closeMenu();
    });
  }

  function bindSwipeToClose() {
    if (!_dom.root) return;
    var startX = 0, currentX = 0, tracking = false;
    _dom.root.addEventListener('touchstart', function (e) {
      if (!_state.isMobile || !_state.openMobile) return;
      startX = e.touches[0].clientX;
      tracking = true;
    }, { passive: true });
    _dom.root.addEventListener('touchmove', function (e) {
      if (!tracking) return;
      currentX = e.touches[0].clientX;
    }, { passive: true });
    _dom.root.addEventListener('touchend', function (e) {
      if (!tracking) return;
      tracking = false;
      var dx = currentX - startX;
      if (dx < -60) closeMobile();
    });
  }

  /* ---------------- Auto-init when DOM ready ---------------- */
  function autoInit() {
    if (root.document && root.document.readyState === 'loading') {
      root.document.addEventListener('DOMContentLoaded', function () { init(); });
    } else {
      init();
    }
  }

  autoInit();

  /* ---------------- Exports ---------------- */
  return {
    init: init,
    getState: getState,
    setState: setState,
    toggle: toggle,
    openMobile: openMobile,
    closeMobile: closeMobile,
    toggleMobile: toggleMobile,
  };
});
