(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (param i32 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32) (result i32)))
  (import "env" "lognc" (func $lognc (type 0)))
  (import "env" "logfc" (func $logfc (type 1)))
  (import "env" "logpc" (func $logpc (type 2)))
  (func $__wasm_call_ctors (type 3))
  (func $__original_main (type 0) (result i32)
    i32.const 0)
  (func $lstr (type 2) (param i32)
    (local i32 i32)
    local.get 0
    call $strlen
    local.set 1
    call $lognc
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.load8_s
        call $logfc
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        br_if 0 (;@2;)
      end
    end
    local.get 2
    call $logpc)
  (func $strlen (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load8_u
        br_if 0 (;@2;)
        local.get 0
        local.get 0
        i32.sub
        return
      end
      local.get 0
      i32.const 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load8_u
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 3
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
      local.get 3
      i32.const -1
      i32.add
      local.get 0
      i32.sub
      return
    end
    loop  ;; label = @1
      local.get 1
      local.tee 2
      i32.const 4
      i32.add
      local.set 1
      local.get 2
      i32.load
      local.tee 3
      i32.const -1
      i32.xor
      local.get 3
      i32.const -16843009
      i32.add
      i32.and
      i32.const -2139062144
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        i32.sub
        return
      end
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.add
        i32.load8_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        i32.sub
        i32.const 1
        i32.add
        return
      end
      block  ;; label = @2
        local.get 2
        i32.const 2
        i32.add
        i32.load8_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        i32.sub
        i32.const 2
        i32.add
        return
      end
      local.get 2
      i32.const 3
      i32.add
      i32.load8_u
      br_if 0 (;@1;)
    end
    local.get 2
    local.get 0
    i32.sub
    i32.const 3
    i32.add)
  (func $bcopy (type 5) (param i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 0
        i32.ge_u
        br_if 0 (;@2;)
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        loop  ;; label = @3
          local.get 1
          local.get 0
          i32.load8_u
          i32.store8
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 1
      i32.const -1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 2
        i32.add
        local.get 0
        local.get 2
        i32.add
        i32.load8_u
        i32.store8
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end)
  (func $memchr (type 6) (param i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          return
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    i32.const 0)
  (func $memcmp (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32)
    loop  ;; label = @1
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 2
      i32.const -1
      i32.add
      local.set 2
      local.get 1
      i32.load8_u
      local.set 3
      local.get 0
      i32.load8_u
      local.set 4
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 4
      local.get 3
      i32.eq
      br_if 0 (;@1;)
    end
    i32.const -1
    i32.const 1
    local.get 4
    local.get 3
    i32.lt_u
    select)
  (func $memcpy (type 6) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $memmove)
  (func $memmove (type 6) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $memmove)
  (func $memmem (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.add
        local.get 3
        i32.sub
        local.tee 4
        local.get 0
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u
        i32.const 255
        i32.and
        local.set 5
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            local.get 5
            i32.ne
            br_if 0 (;@4;)
            i32.const 1
            local.set 1
            loop  ;; label = @5
              local.get 3
              local.get 1
              i32.eq
              br_if 4 (;@1;)
              local.get 0
              local.get 1
              i32.add
              local.set 6
              local.get 2
              local.get 1
              i32.add
              local.set 7
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              local.get 6
              i32.load8_u
              local.get 7
              i32.load8_u
              i32.eq
              br_if 0 (;@5;)
            end
          end
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.set 0
    end
    local.get 0)
  (func $mempcpy (type 6) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $memcpy
    local.get 2
    i32.add)
  (func $memset (type 6) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $main (type 8) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 1)
  (global (;0;) (mut i32) (i32.const 9216))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 9216))
  (global (;5;) i32 (i32.const 0))
  (global (;6;) i32 (i32.const 1))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__original_main" (func $__original_main))
  (export "lstr" (func $lstr))
  (export "strlen" (func $strlen))
  (export "bcopy" (func $bcopy))
  (export "memchr" (func $memchr))
  (export "memcmp" (func $memcmp))
  (export "memcpy" (func $memcpy))
  (export "memmove" (func $memmove))
  (export "memmem" (func $memmem))
  (export "mempcpy" (func $mempcpy))
  (export "memset" (func $memset))
  (export "main" (func $main))
  (export "__main_void" (func $__original_main))
  (export "__dso_handle" (global 1))
  (export "__data_end" (global 2))
  (export "__global_base" (global 3))
  (export "__heap_base" (global 4))
  (export "__memory_base" (global 5))
  (export "__table_base" (global 6)))
