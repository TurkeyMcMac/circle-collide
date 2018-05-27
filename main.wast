(module
 (type $0 (func (param i32)))
 (type $1 (func (param f64) (result f64)))
 (type $2 (func (param f64 f64 f64)))
 (type $3 (func (param i32 i32 i32) (result i32)))
 (type $4 (func (param i32) (result f32)))
 (type $5 (func (param i32 f32)))
 (type $6 (func (param i32 i32 f32) (result i32)))
 (type $7 (func (param i32 i32)))
 (type $8 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $9 (func (param i32 i32 i32)))
 (type $10 (func (param i32 i32 i32 i32 i32)))
 (type $11 (func (param i32 i32 f32 f32)))
 (type $12 (func))
 (type $13 (func (result i32)))
 (type $14 (func (param i32) (result i32)))
 (type $15 (func (param i32 i32) (result f32)))
 (type $16 (func (result f64)))
 (type $17 (func (param i32 i32) (result f64)))
 (type $18 (func (param i32 i32 f64 f64)))
 (type $19 (func (param i32) (result f64)))
 (type $20 (func (param i32 f64)))
 (type $21 (func (param i32 i32 f64) (result i32)))
 (import "env" "memory" (memory $0 256))
 (import "env" "table" (table 64 anyfunc))
 (import "env" "memoryBase" (global $gimport$2 i32))
 (import "env" "tableBase" (global $gimport$3 i32))
 (import "env" "abort" (func $fimport$4 (param i32)))
 (import "env" "_asinf" (func $fimport$5 (param f64) (result f64)))
 (import "env" "_cosf" (func $fimport$6 (param f64) (result f64)))
 (import "env" "_jsDrawCircle" (func $fimport$7 (param f64 f64 f64)))
 (import "env" "_sinf" (func $fimport$8 (param f64) (result f64)))
 (global $global$0 (mut i32) (i32.const 0))
 (global $global$1 (mut i32) (i32.const 0))
 (global $global$2 i32 (i32.const 34))
 (global $global$3 i32 (i32.const 39))
 (global $global$4 i32 (i32.const 33))
 (global $global$5 i32 (i32.const 37))
 (global $global$6 i32 (i32.const 35))
 (global $global$7 i32 (i32.const 36))
 (global $global$8 i32 (i32.const 38))
 (global $global$9 i32 (i32.const 31))
 (global $global$10 i32 (i32.const 27))
 (global $global$11 i32 (i32.const 32))
 (global $global$12 i32 (i32.const 1))
 (global $global$13 i32 (i32.const 30))
 (global $global$14 i32 (i32.const 29))
 (global $global$15 i32 (i32.const 28))
 (global $global$16 i32 (i32.const 12))
 (global $global$17 i32 (i32.const 14))
 (global $global$18 i32 (i32.const 11))
 (global $global$19 i32 (i32.const 13))
 (global $global$20 i32 (i32.const 2))
 (global $global$21 i32 (i32.const 3))
 (global $global$22 i32 (i32.const 4))
 (global $global$23 i32 (i32.const 26))
 (global $global$24 i32 (i32.const 8))
 (global $global$25 i32 (i32.const 25))
 (global $global$26 i32 (i32.const 7))
 (global $global$27 i32 (i32.const 5))
 (global $global$28 i32 (i32.const 6))
 (global $global$29 i32 (i32.const 24))
 (global $global$30 i32 (i32.const 22))
 (global $global$31 i32 (i32.const 21))
 (global $global$32 i32 (i32.const 23))
 (global $global$33 i32 (i32.const 18))
 (global $global$34 i32 (i32.const 19))
 (global $global$35 i32 (i32.const 20))
 (global $global$36 i32 (i32.const 9))
 (global $global$37 i32 (i32.const 10))
 (global $global$38 i32 (i32.const 16))
 (global $global$39 i32 (i32.const 15))
 (global $global$40 i32 (i32.const 17))
 (elem (get_global $gimport$3) $41 $0 $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21 $22 $23 $24 $25 $26 $27 $28 $29 $30 $31 $32 $33 $34 $35 $36 $37 $38 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41 $41)
 (data (get_global $gimport$2) "@")
 (export "__post_instantiate" (func $40))
 (export "_circle_collide" (func $42))
 (export "_circle_collide_all" (func $38))
 (export "_circle_draw" (func $32))
 (export "_circle_finish_update" (func $36))
 (export "_circle_is_updated" (func $34))
 (export "_circle_set_updated" (func $35))
 (export "_circle_wrap_position" (func $37))
 (export "_ealloc" (func $30))
 (export "_init" (func $43))
 (export "_memset" (func $31))
 (export "_neural_net_compute" (func $0))
 (export "_random" (func $29))
 (export "_seed_random" (func $28))
 (export "_step_circles" (func $27))
 (export "_tile_unwrap_x" (func $11))
 (export "_tile_unwrap_y" (func $13))
 (export "_tile_wrap_x" (func $10))
 (export "_tile_wrap_y" (func $12))
 (export "_vec2d_length" (func $44))
 (export "_vec2d_norm" (func $2))
 (export "_vec2d_rotate" (func $45))
 (export "_world_draw" (func $25))
 (export "_world_get_wrap" (func $7))
 (export "_world_move_circles" (func $24))
 (export "_world_neighbor" (func $6))
 (export "_world_new" (func $46))
 (export "_world_put" (func $5))
 (export "_world_reset_updates" (func $23))
 (export "_world_update_bottom" (func $21))
 (export "_world_update_bottom_left" (func $20))
 (export "_world_update_bottom_right" (func $22))
 (export "_world_update_left" (func $17))
 (export "_world_update_middle" (func $18))
 (export "_world_update_right" (func $19))
 (export "_world_update_tile_with_itself" (func $8))
 (export "_world_update_tiles" (func $9))
 (export "_world_update_top" (func $15))
 (export "_world_update_top_left" (func $14))
 (export "_world_update_top_right" (func $16))
 (export "runPostSets" (func $39))
 (export "fp$_circle_collide" (global $global$2))
 (export "fp$_circle_collide_all" (global $global$3))
 (export "fp$_circle_draw" (global $global$4))
 (export "fp$_circle_finish_update" (global $global$5))
 (export "fp$_circle_is_updated" (global $global$6))
 (export "fp$_circle_set_updated" (global $global$7))
 (export "fp$_circle_wrap_position" (global $global$8))
 (export "fp$_ealloc" (global $global$9))
 (export "fp$_init" (global $global$10))
 (export "fp$_memset" (global $global$11))
 (export "fp$_neural_net_compute" (global $global$12))
 (export "fp$_random" (global $global$13))
 (export "fp$_seed_random" (global $global$14))
 (export "fp$_step_circles" (global $global$15))
 (export "fp$_tile_unwrap_x" (global $global$16))
 (export "fp$_tile_unwrap_y" (global $global$17))
 (export "fp$_tile_wrap_x" (global $global$18))
 (export "fp$_tile_wrap_y" (global $global$19))
 (export "fp$_vec2d_length" (global $global$20))
 (export "fp$_vec2d_norm" (global $global$21))
 (export "fp$_vec2d_rotate" (global $global$22))
 (export "fp$_world_draw" (global $global$23))
 (export "fp$_world_get_wrap" (global $global$24))
 (export "fp$_world_move_circles" (global $global$25))
 (export "fp$_world_neighbor" (global $global$26))
 (export "fp$_world_new" (global $global$27))
 (export "fp$_world_put" (global $global$28))
 (export "fp$_world_reset_updates" (global $global$29))
 (export "fp$_world_update_bottom" (global $global$30))
 (export "fp$_world_update_bottom_left" (global $global$31))
 (export "fp$_world_update_bottom_right" (global $global$32))
 (export "fp$_world_update_left" (global $global$33))
 (export "fp$_world_update_middle" (global $global$34))
 (export "fp$_world_update_right" (global $global$35))
 (export "fp$_world_update_tile_with_itself" (global $global$36))
 (export "fp$_world_update_tiles" (global $global$37))
 (export "fp$_world_update_top" (global $global$38))
 (export "fp$_world_update_top_left" (global $global$39))
 (export "fp$_world_update_top_right" (global $global$40))
 (func $0 (; 5 ;) (type $3) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32) (result i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 i32)
  (set_local $var$8
   (i32.load offset=8
    (get_local $var$0)
   )
  )
  (if
   (i32.eqz
    (i32.or
     (tee_local $var$9
      (i32.eqz
       (tee_local $var$6
        (i32.load offset=4
         (get_local $var$0)
        )
       )
      )
     )
     (i32.eqz
      (tee_local $var$5
       (i32.load
        (get_local $var$0)
       )
      )
     )
    )
   )
   (block
    (set_local $var$0
     (get_local $var$6)
    )
    (loop $label$2
     (set_local $var$10
      (i32.add
       (get_local $var$1)
       (i32.mul
        (tee_local $var$4
         (i32.add
          (get_local $var$0)
          (i32.const -1)
         )
        )
        (get_local $var$5)
       )
      )
     )
     (set_local $var$0
      (i32.const 0)
     )
     (set_local $var$3
      (get_local $var$5)
     )
     (loop $label$3
      (if
       (i32.and
        (i32.shl
         (i32.const 1)
         (tee_local $var$3
          (i32.add
           (get_local $var$3)
           (i32.const -1)
          )
         )
        )
        (get_local $var$2)
       )
       (set_local $var$0
        (i32.add
         (get_local $var$0)
         (i32.load8_s
          (i32.add
           (get_local $var$10)
           (get_local $var$3)
          )
         )
        )
       )
      )
      (br_if $label$3
       (get_local $var$3)
      )
     )
     (set_local $var$0
      (i32.or
       (i32.shl
        (i32.gt_s
         (get_local $var$0)
         (i32.const 0)
        )
        (get_local $var$4)
       )
       (get_local $var$7)
      )
     )
     (set_local $var$4
      (if (result i32)
       (get_local $var$4)
       (block (result i32)
        (set_local $var$7
         (get_local $var$0)
        )
        (set_local $var$0
         (get_local $var$4)
        )
        (br $label$2)
       )
       (get_local $var$0)
      )
     )
    )
   )
  )
  (if
   (i32.or
    (i32.eqz
     (get_local $var$8)
    )
    (get_local $var$9)
   )
   (return
    (i32.const 0)
   )
  )
  (set_local $var$7
   (i32.add
    (get_local $var$1)
    (i32.mul
     (get_local $var$5)
     (get_local $var$6)
    )
   )
  )
  (set_local $var$3
   (i32.const 0)
  )
  (set_local $var$0
   (get_local $var$8)
  )
  (loop $label$8
   (set_local $var$5
    (i32.add
     (get_local $var$7)
     (i32.mul
      (tee_local $var$2
       (i32.add
        (get_local $var$0)
        (i32.const -1)
       )
      )
      (get_local $var$6)
     )
    )
   )
   (set_local $var$0
    (i32.const 0)
   )
   (set_local $var$1
    (get_local $var$6)
   )
   (loop $label$9
    (if
     (i32.and
      (i32.shl
       (i32.const 1)
       (tee_local $var$1
        (i32.add
         (get_local $var$1)
         (i32.const -1)
        )
       )
      )
      (get_local $var$4)
     )
     (set_local $var$0
      (i32.add
       (get_local $var$0)
       (i32.load8_s
        (i32.add
         (get_local $var$5)
         (get_local $var$1)
        )
       )
      )
     )
    )
    (br_if $label$9
     (get_local $var$1)
    )
   )
   (set_local $var$0
    (i32.or
     (i32.shl
      (i32.gt_s
       (get_local $var$0)
       (i32.const 0)
      )
      (get_local $var$2)
     )
     (get_local $var$3)
    )
   )
   (if
    (get_local $var$2)
    (block
     (set_local $var$3
      (get_local $var$0)
     )
     (set_local $var$0
      (get_local $var$2)
     )
     (br $label$8)
    )
   )
  )
  (get_local $var$0)
 )
 (func $1 (; 6 ;) (type $4) (param $var$0 i32) (result f32)
  (local $var$1 f32)
  (f32.sqrt
   (f32.add
    (f32.mul
     (tee_local $var$1
      (f32.load
       (get_local $var$0)
      )
     )
     (get_local $var$1)
    )
    (f32.mul
     (tee_local $var$1
      (f32.load offset=4
       (get_local $var$0)
      )
     )
     (get_local $var$1)
    )
   )
  )
 )
 (func $2 (; 7 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 f32)
  (local $var$3 f32)
  (local $var$4 f32)
  (set_local $var$4
   (f32.sqrt
    (f32.add
     (f32.mul
      (tee_local $var$2
       (f32.load
        (get_local $var$0)
       )
      )
      (get_local $var$2)
     )
     (f32.mul
      (tee_local $var$3
       (f32.load
        (tee_local $var$1
         (i32.add
          (get_local $var$0)
          (i32.const 4)
         )
        )
       )
      )
      (get_local $var$3)
     )
    )
   )
  )
  (f32.store
   (get_local $var$0)
   (f32.div
    (get_local $var$2)
    (get_local $var$4)
   )
  )
  (f32.store
   (get_local $var$1)
   (f32.div
    (get_local $var$3)
    (get_local $var$4)
   )
  )
 )
 (func $3 (; 8 ;) (type $5) (param $var$0 i32) (param $var$1 f32)
  (local $var$2 i32)
  (local $var$3 f32)
  (local $var$4 f32)
  (local $var$5 f32)
  (set_local $var$3
   (f32.load
    (get_local $var$0)
   )
  )
  (set_local $var$4
   (f32.demote/f64
    (call $fimport$6
     (f64.promote/f32
      (get_local $var$1)
     )
    )
   )
  )
  (set_local $var$5
   (f32.load
    (tee_local $var$2
     (i32.add
      (get_local $var$0)
      (i32.const 4)
     )
    )
   )
  )
  (f32.store
   (get_local $var$0)
   (f32.sub
    (f32.mul
     (get_local $var$4)
     (get_local $var$3)
    )
    (f32.mul
     (tee_local $var$1
      (f32.demote/f64
       (call $fimport$8
        (f64.promote/f32
         (get_local $var$1)
        )
       )
      )
     )
     (get_local $var$5)
    )
   )
  )
  (f32.store
   (get_local $var$2)
   (f32.add
    (f32.mul
     (get_local $var$1)
     (get_local $var$3)
    )
    (f32.mul
     (get_local $var$4)
     (get_local $var$5)
    )
   )
  )
 )
 (func $4 (; 9 ;) (type $6) (param $var$0 i32) (param $var$1 i32) (param $var$2 f32) (result i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (i32.store
   (get_global $gimport$2)
   (i32.add
    (tee_local $var$4
     (i32.load
      (get_global $gimport$2)
     )
    )
    (i32.sub
     (tee_local $var$7
      (i32.add
       (tee_local $var$3
        (i32.add
         (tee_local $var$6
          (i32.shl
           (tee_local $var$5
            (i32.mul
             (get_local $var$1)
             (get_local $var$0)
            )
           )
           (i32.const 2)
          )
         )
         (i32.const 12)
        )
       )
       (i32.const 3)
      )
     )
     (if (result i32)
      (get_local $var$3)
      (i32.rem_u
       (get_local $var$7)
       (get_local $var$3)
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (tee_local $var$3
    (get_local $var$4)
   )
   (get_local $var$0)
  )
  (i32.store offset=4
   (get_local $var$3)
   (get_local $var$1)
  )
  (f32.store offset=8
   (get_local $var$3)
   (get_local $var$2)
  )
  (if
   (i32.eqz
    (get_local $var$5)
   )
   (return
    (get_local $var$3)
   )
  )
  (drop
   (call $31
    (i32.add
     (get_local $var$3)
     (i32.const 12)
    )
    (i32.const 0)
    (get_local $var$6)
   )
  )
  (get_local $var$3)
 )
 (func $5 (; 10 ;) (type $7) (param $var$0 i32) (param $var$1 i32)
  (local $var$2 i32)
  (local $var$3 f32)
  (local $var$4 f32)
  (set_local $var$2
   (if (result i32)
    (f32.ne
     (tee_local $var$3
      (f32.div
       (f32.load offset=8
        (get_local $var$1)
       )
       (tee_local $var$4
        (f32.load offset=8
         (get_local $var$0)
        )
       )
      )
     )
     (get_local $var$3)
    )
    (i32.const 0)
    (if (result i32)
     (f32.ge
      (get_local $var$3)
      (f32.const 4294967296)
     )
     (i32.const 0)
     (if (result i32)
      (f32.le
       (get_local $var$3)
       (f32.const -1)
      )
      (i32.const 0)
      (i32.trunc_u/f32
       (get_local $var$3)
      )
     )
    )
   )
  )
  (i32.store
   (get_local $var$1)
   (i32.load
    (tee_local $var$0
     (i32.add
      (i32.add
       (get_local $var$0)
       (i32.const 12)
      )
      (i32.shl
       (i32.add
        (i32.mul
         (i32.load
          (get_local $var$0)
         )
         (if (result i32)
          (f32.ne
           (tee_local $var$3
            (f32.div
             (f32.load offset=12
              (get_local $var$1)
             )
             (get_local $var$4)
            )
           )
           (get_local $var$3)
          )
          (i32.const 0)
          (if (result i32)
           (f32.ge
            (get_local $var$3)
            (f32.const 4294967296)
           )
           (i32.const 0)
           (if (result i32)
            (f32.le
             (get_local $var$3)
             (f32.const -1)
            )
            (i32.const 0)
            (i32.trunc_u/f32
             (get_local $var$3)
            )
           )
          )
         )
        )
        (get_local $var$2)
       )
       (i32.const 2)
      )
     )
    )
   )
  )
  (i32.store
   (get_local $var$0)
   (get_local $var$1)
  )
 )
 (func $6 (; 11 ;) (type $8) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32) (param $var$3 i32) (param $var$4 i32) (result i32)
  (set_local $var$4
   (i32.load
    (get_local $var$0)
   )
  )
  (if
   (i32.lt_s
    (tee_local $var$1
     (i32.add
      (get_local $var$3)
      (get_local $var$1)
     )
    )
    (i32.const 0)
   )
   (loop $label$2
    (br_if $label$2
     (i32.lt_s
      (tee_local $var$1
       (i32.add
        (get_local $var$4)
        (get_local $var$1)
       )
      )
      (i32.const 0)
     )
    )
   )
   (set_local $var$1
    (if (result i32)
     (get_local $var$4)
     (i32.rem_u
      (get_local $var$1)
      (get_local $var$4)
     )
     (i32.const 0)
    )
   )
  )
  (i32.add
   (i32.add
    (get_local $var$0)
    (i32.const 12)
   )
   (i32.shl
    (i32.add
     (i32.mul
      (get_local $var$4)
      (i32.add
       (get_local $var$3)
       (get_local $var$2)
      )
     )
     (get_local $var$1)
    )
    (i32.const 2)
   )
  )
 )
 (func $7 (; 12 ;) (type $3) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32) (result i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (set_local $var$3
   (i32.load
    (get_local $var$0)
   )
  )
  (if
   (i32.lt_s
    (get_local $var$1)
    (i32.const 0)
   )
   (loop $label$2
    (br_if $label$2
     (i32.lt_s
      (tee_local $var$1
       (i32.add
        (get_local $var$1)
        (get_local $var$3)
       )
      )
      (i32.const 0)
     )
    )
   )
   (set_local $var$1
    (if (result i32)
     (get_local $var$3)
     (i32.rem_s
      (get_local $var$1)
      (get_local $var$3)
     )
     (i32.const 0)
    )
   )
  )
  (set_local $var$4
   (i32.load offset=4
    (get_local $var$0)
   )
  )
  (if
   (i32.lt_s
    (get_local $var$2)
    (i32.const 0)
   )
   (loop $label$7
    (br_if $label$7
     (i32.lt_s
      (tee_local $var$2
       (i32.add
        (get_local $var$2)
        (get_local $var$4)
       )
      )
      (i32.const 0)
     )
    )
   )
   (set_local $var$2
    (if (result i32)
     (get_local $var$4)
     (i32.rem_s
      (get_local $var$2)
      (get_local $var$4)
     )
     (i32.const 0)
    )
   )
  )
  (i32.add
   (i32.add
    (get_local $var$0)
    (i32.const 12)
   )
   (i32.shl
    (i32.add
     (i32.mul
      (get_local $var$2)
      (get_local $var$3)
     )
     (get_local $var$1)
    )
    (i32.const 2)
   )
  )
 )
 (func $8 (; 13 ;) (type $9) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (tee_local $var$2
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (i32.mul
           (i32.load
            (get_local $var$0)
           )
           (get_local $var$2)
          )
          (get_local $var$1)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
   )
   (return)
  )
  (loop $label$2
   (set_local $var$3
    (call $38
     (get_local $var$1)
     (get_local $var$1)
     (get_local $var$0)
    )
   )
   (set_local $var$4
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$4)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$3)
      )
     )
     (i32.store
      (get_local $var$3)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$4)
    (block
     (set_local $var$1
      (get_local $var$4)
     )
     (br $label$2)
    )
   )
  )
 )
 (func $9 (; 14 ;) (type $10) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32) (param $var$3 i32) (param $var$4 i32)
  (local $var$5 i32)
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (tee_local $var$2
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (i32.mul
           (tee_local $var$5
            (i32.load
             (get_local $var$0)
            )
           )
           (get_local $var$2)
          )
          (get_local $var$1)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$5
   (i32.add
    (i32.add
     (get_local $var$0)
     (i32.const 12)
    )
    (i32.shl
     (i32.add
      (i32.mul
       (get_local $var$5)
       (get_local $var$4)
      )
      (get_local $var$3)
     )
     (i32.const 2)
    )
   )
  )
  (loop $label$2
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (tee_local $var$4
     (call $38
      (get_local $var$1)
      (get_local $var$5)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$4)
      )
     )
     (i32.store
      (get_local $var$4)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$2)
    )
   )
  )
 )
 (func $10 (; 15 ;) (type $7) (param $var$0 i32) (param $var$1 i32)
  (local $var$2 i32)
  (local $var$3 f32)
  (if
   (i32.eqz
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
   (return)
  )
  (set_local $var$3
   (f32.convert_u/i32
    (i32.load
     (get_local $var$1)
    )
   )
  )
  (set_local $var$1
   (i32.add
    (get_local $var$1)
    (i32.const 8)
   )
  )
  (loop $label$2
   (f32.store
    (tee_local $var$2
     (i32.add
      (get_local $var$0)
      (i32.const 8)
     )
    )
    (f32.sub
     (f32.load
      (get_local $var$2)
     )
     (f32.mul
      (f32.load
       (get_local $var$1)
      )
      (get_local $var$3)
     )
    )
   )
   (br_if $label$2
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
  )
 )
 (func $11 (; 16 ;) (type $7) (param $var$0 i32) (param $var$1 i32)
  (local $var$2 i32)
  (local $var$3 f32)
  (if
   (i32.eqz
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
   (return)
  )
  (set_local $var$3
   (f32.convert_u/i32
    (i32.load
     (get_local $var$1)
    )
   )
  )
  (set_local $var$1
   (i32.add
    (get_local $var$1)
    (i32.const 8)
   )
  )
  (loop $label$2
   (f32.store
    (tee_local $var$2
     (i32.add
      (get_local $var$0)
      (i32.const 8)
     )
    )
    (f32.add
     (f32.load
      (get_local $var$2)
     )
     (f32.mul
      (f32.load
       (get_local $var$1)
      )
      (get_local $var$3)
     )
    )
   )
   (br_if $label$2
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
  )
 )
 (func $12 (; 17 ;) (type $7) (param $var$0 i32) (param $var$1 i32)
  (local $var$2 i32)
  (local $var$3 f32)
  (if
   (i32.eqz
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
   (return)
  )
  (set_local $var$3
   (f32.convert_u/i32
    (i32.load offset=4
     (get_local $var$1)
    )
   )
  )
  (set_local $var$1
   (i32.add
    (get_local $var$1)
    (i32.const 8)
   )
  )
  (loop $label$2
   (f32.store
    (tee_local $var$2
     (i32.add
      (get_local $var$0)
      (i32.const 12)
     )
    )
    (f32.sub
     (f32.load
      (get_local $var$2)
     )
     (f32.mul
      (f32.load
       (get_local $var$1)
      )
      (get_local $var$3)
     )
    )
   )
   (br_if $label$2
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
  )
 )
 (func $13 (; 18 ;) (type $7) (param $var$0 i32) (param $var$1 i32)
  (local $var$2 i32)
  (local $var$3 f32)
  (if
   (i32.eqz
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
   (return)
  )
  (set_local $var$3
   (f32.convert_u/i32
    (i32.load offset=4
     (get_local $var$1)
    )
   )
  )
  (set_local $var$1
   (i32.add
    (get_local $var$1)
    (i32.const 8)
   )
  )
  (loop $label$2
   (f32.store
    (tee_local $var$2
     (i32.add
      (get_local $var$0)
      (i32.const 12)
     )
    )
    (f32.add
     (f32.load
      (get_local $var$2)
     )
     (f32.mul
      (f32.load
       (get_local $var$1)
      )
      (get_local $var$3)
     )
    )
   )
   (br_if $label$2
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
  )
 )
 (func $14 (; 19 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 f32)
  (if
   (tee_local $var$1
    (i32.load
     (tee_local $var$5
      (i32.add
       (get_local $var$0)
       (i32.const 12)
      )
     )
    )
   )
   (block
    (set_local $var$3
     (get_local $var$5)
    )
    (loop $label$2
     (set_local $var$4
      (call $38
       (get_local $var$1)
       (get_local $var$1)
       (get_local $var$0)
      )
     )
     (set_local $var$2
      (i32.load
       (get_local $var$1)
      )
     )
     (if
      (get_local $var$4)
      (block
       (i32.store
        (get_local $var$3)
        (get_local $var$2)
       )
       (i32.store
        (get_local $var$1)
        (i32.load
         (get_local $var$4)
        )
       )
       (i32.store
        (get_local $var$4)
        (get_local $var$1)
       )
      )
      (set_local $var$3
       (get_local $var$1)
      )
     )
     (if
      (get_local $var$2)
      (block
       (set_local $var$1
        (get_local $var$2)
       )
       (br $label$2)
      )
     )
    )
    (set_local $var$6
     (i32.add
      (get_local $var$0)
      (i32.const 16)
     )
    )
    (if
     (tee_local $var$1
      (i32.load
       (get_local $var$5)
      )
     )
     (block
      (set_local $var$3
       (get_local $var$5)
      )
      (loop $label$7
       (set_local $var$2
        (i32.load
         (get_local $var$1)
        )
       )
       (if
        (tee_local $var$4
         (call $38
          (get_local $var$1)
          (get_local $var$6)
          (get_local $var$0)
         )
        )
        (block
         (i32.store
          (get_local $var$3)
          (get_local $var$2)
         )
         (i32.store
          (get_local $var$1)
          (i32.load
           (get_local $var$4)
          )
         )
         (i32.store
          (get_local $var$4)
          (get_local $var$1)
         )
        )
        (set_local $var$3
         (get_local $var$1)
        )
       )
       (if
        (get_local $var$2)
        (block
         (set_local $var$1
          (get_local $var$2)
         )
         (br $label$7)
        )
       )
      )
      (set_local $var$6
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.shl
          (i32.load
           (get_local $var$0)
          )
          (i32.const 2)
         )
        )
        (i32.const 16)
       )
      )
      (if
       (tee_local $var$1
        (i32.load
         (get_local $var$5)
        )
       )
       (block
        (set_local $var$3
         (get_local $var$5)
        )
        (loop $label$12
         (set_local $var$2
          (i32.load
           (get_local $var$1)
          )
         )
         (if
          (tee_local $var$4
           (call $38
            (get_local $var$1)
            (get_local $var$6)
            (get_local $var$0)
           )
          )
          (block
           (i32.store
            (get_local $var$3)
            (get_local $var$2)
           )
           (i32.store
            (get_local $var$1)
            (i32.load
             (get_local $var$4)
            )
           )
           (i32.store
            (get_local $var$4)
            (get_local $var$1)
           )
          )
          (set_local $var$3
           (get_local $var$1)
          )
         )
         (if
          (get_local $var$2)
          (block
           (set_local $var$1
            (get_local $var$2)
           )
           (br $label$12)
          )
         )
        )
        (set_local $var$6
         (i32.add
          (i32.add
           (get_local $var$0)
           (i32.const 12)
          )
          (i32.shl
           (i32.load
            (get_local $var$0)
           )
           (i32.const 2)
          )
         )
        )
        (if
         (tee_local $var$1
          (i32.load
           (get_local $var$5)
          )
         )
         (block
          (set_local $var$3
           (get_local $var$5)
          )
          (loop $label$17
           (set_local $var$2
            (i32.load
             (get_local $var$1)
            )
           )
           (if
            (tee_local $var$4
             (call $38
              (get_local $var$1)
              (get_local $var$6)
              (get_local $var$0)
             )
            )
            (block
             (i32.store
              (get_local $var$3)
              (get_local $var$2)
             )
             (i32.store
              (get_local $var$1)
              (i32.load
               (get_local $var$4)
              )
             )
             (i32.store
              (get_local $var$4)
              (get_local $var$1)
             )
            )
            (set_local $var$3
             (get_local $var$1)
            )
           )
           (if
            (get_local $var$2)
            (block
             (set_local $var$1
              (get_local $var$2)
             )
             (br $label$17)
            )
           )
          )
         )
        )
       )
      )
     )
    )
   )
  )
  (if
   (tee_local $var$1
    (i32.load
     (tee_local $var$2
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.shl
         (tee_local $var$3
          (i32.load
           (get_local $var$0)
          )
         )
         (i32.const 3)
        )
       )
       (i32.const 8)
      )
     )
    )
   )
   (block
    (set_local $var$7
     (f32.convert_u/i32
      (get_local $var$3)
     )
    )
    (set_local $var$4
     (i32.add
      (get_local $var$0)
      (i32.const 8)
     )
    )
    (loop $label$22
     (f32.store
      (tee_local $var$6
       (i32.add
        (get_local $var$1)
        (i32.const 8)
       )
      )
      (f32.sub
       (f32.load
        (get_local $var$6)
       )
       (f32.mul
        (f32.load
         (get_local $var$4)
        )
        (get_local $var$7)
       )
      )
     )
     (br_if $label$22
      (tee_local $var$1
       (i32.load
        (get_local $var$1)
       )
      )
     )
    )
   )
  )
  (if
   (tee_local $var$1
    (i32.load
     (get_local $var$5)
    )
   )
   (block
    (loop $label$24
     (set_local $var$3
      (i32.load
       (get_local $var$1)
      )
     )
     (if
      (tee_local $var$4
       (call $38
        (get_local $var$1)
        (get_local $var$2)
        (get_local $var$0)
       )
      )
      (block
       (i32.store
        (get_local $var$5)
        (get_local $var$3)
       )
       (i32.store
        (get_local $var$1)
        (i32.load
         (get_local $var$4)
        )
       )
       (i32.store
        (get_local $var$4)
        (get_local $var$1)
       )
      )
      (set_local $var$5
       (get_local $var$1)
      )
     )
     (if
      (get_local $var$3)
      (block
       (set_local $var$1
        (get_local $var$3)
       )
       (br $label$24)
      )
     )
    )
    (set_local $var$2
     (i32.add
      (i32.add
       (get_local $var$0)
       (i32.shl
        (tee_local $var$5
         (i32.load
          (get_local $var$0)
         )
        )
        (i32.const 3)
       )
      )
      (i32.const 8)
     )
    )
   )
   (set_local $var$5
    (get_local $var$3)
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (get_local $var$2)
     )
    )
   )
   (return)
  )
  (set_local $var$7
   (f32.convert_u/i32
    (get_local $var$5)
   )
  )
  (set_local $var$5
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$0
   (get_local $var$1)
  )
  (loop $label$30
   (f32.store
    (tee_local $var$1
     (i32.add
      (get_local $var$0)
      (i32.const 8)
     )
    )
    (f32.add
     (f32.load
      (get_local $var$1)
     )
     (f32.mul
      (f32.load
       (get_local $var$5)
      )
      (get_local $var$7)
     )
    )
   )
   (br_if $label$30
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
  )
 )
 (func $15 (; 20 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (if
   (i32.le_u
    (i32.add
     (i32.load
      (get_local $var$0)
     )
     (i32.const -1)
    )
    (i32.const 1)
   )
   (return)
  )
  (set_local $var$6
   (i32.const 1)
  )
  (loop $label$2
   (if
    (tee_local $var$5
     (i32.load
      (tee_local $var$2
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (get_local $var$6)
         (i32.const 2)
        )
       )
      )
     )
    )
    (block
     (set_local $var$1
      (get_local $var$2)
     )
     (loop $label$4
      (set_local $var$3
       (call $38
        (get_local $var$5)
        (get_local $var$5)
        (get_local $var$0)
       )
      )
      (set_local $var$4
       (i32.load
        (get_local $var$5)
       )
      )
      (if
       (get_local $var$3)
       (block
        (i32.store
         (get_local $var$1)
         (get_local $var$4)
        )
        (i32.store
         (get_local $var$5)
         (i32.load
          (get_local $var$3)
         )
        )
        (i32.store
         (get_local $var$3)
         (get_local $var$5)
        )
       )
       (set_local $var$1
        (get_local $var$5)
       )
      )
      (if
       (get_local $var$4)
       (block
        (set_local $var$5
         (get_local $var$4)
        )
        (br $label$4)
       )
      )
     )
     (set_local $var$8
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.const 12)
       )
       (i32.shl
        (tee_local $var$5
         (i32.add
          (get_local $var$6)
          (i32.const 1)
         )
        )
        (i32.const 2)
       )
      )
     )
     (if
      (tee_local $var$1
       (i32.load
        (get_local $var$2)
       )
      )
      (block
       (set_local $var$4
        (get_local $var$2)
       )
       (loop $label$9
        (set_local $var$3
         (i32.load
          (get_local $var$1)
         )
        )
        (if
         (tee_local $var$7
          (call $38
           (get_local $var$1)
           (get_local $var$8)
           (get_local $var$0)
          )
         )
         (block
          (i32.store
           (get_local $var$4)
           (get_local $var$3)
          )
          (i32.store
           (get_local $var$1)
           (i32.load
            (get_local $var$7)
           )
          )
          (i32.store
           (get_local $var$7)
           (get_local $var$1)
          )
         )
         (set_local $var$4
          (get_local $var$1)
         )
        )
        (if
         (get_local $var$3)
         (block
          (set_local $var$1
           (get_local $var$3)
          )
          (br $label$9)
         )
        )
       )
       (set_local $var$8
        (i32.add
         (i32.add
          (get_local $var$0)
          (i32.const 12)
         )
         (i32.shl
          (i32.add
           (i32.load
            (get_local $var$0)
           )
           (get_local $var$5)
          )
          (i32.const 2)
         )
        )
       )
       (if
        (tee_local $var$1
         (i32.load
          (get_local $var$2)
         )
        )
        (block
         (set_local $var$4
          (get_local $var$2)
         )
         (loop $label$14
          (set_local $var$3
           (i32.load
            (get_local $var$1)
           )
          )
          (if
           (tee_local $var$7
            (call $38
             (get_local $var$1)
             (get_local $var$8)
             (get_local $var$0)
            )
           )
           (block
            (i32.store
             (get_local $var$4)
             (get_local $var$3)
            )
            (i32.store
             (get_local $var$1)
             (i32.load
              (get_local $var$7)
             )
            )
            (i32.store
             (get_local $var$7)
             (get_local $var$1)
            )
           )
           (set_local $var$4
            (get_local $var$1)
           )
          )
          (if
           (get_local $var$3)
           (block
            (set_local $var$1
             (get_local $var$3)
            )
            (br $label$14)
           )
          )
         )
         (set_local $var$8
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (i32.add
             (i32.load
              (get_local $var$0)
             )
             (get_local $var$6)
            )
            (i32.const 2)
           )
          )
         )
         (if
          (tee_local $var$1
           (i32.load
            (get_local $var$2)
           )
          )
          (block
           (set_local $var$4
            (get_local $var$2)
           )
           (loop $label$19
            (set_local $var$3
             (i32.load
              (get_local $var$1)
             )
            )
            (if
             (tee_local $var$7
              (call $38
               (get_local $var$1)
               (get_local $var$8)
               (get_local $var$0)
              )
             )
             (block
              (i32.store
               (get_local $var$4)
               (get_local $var$3)
              )
              (i32.store
               (get_local $var$1)
               (i32.load
                (get_local $var$7)
               )
              )
              (i32.store
               (get_local $var$7)
               (get_local $var$1)
              )
             )
             (set_local $var$4
              (get_local $var$1)
             )
            )
            (if
             (get_local $var$3)
             (block
              (set_local $var$1
               (get_local $var$3)
              )
              (br $label$19)
             )
            )
           )
           (set_local $var$3
            (i32.add
             (i32.add
              (get_local $var$0)
              (i32.shl
               (i32.add
                (get_local $var$6)
                (i32.load
                 (get_local $var$0)
                )
               )
               (i32.const 2)
              )
             )
             (i32.const 8)
            )
           )
           (if
            (tee_local $var$1
             (i32.load
              (get_local $var$2)
             )
            )
            (loop $label$24
             (set_local $var$4
              (i32.load
               (get_local $var$1)
              )
             )
             (if
              (tee_local $var$6
               (call $38
                (get_local $var$1)
                (get_local $var$3)
                (get_local $var$0)
               )
              )
              (block
               (i32.store
                (get_local $var$2)
                (get_local $var$4)
               )
               (i32.store
                (get_local $var$1)
                (i32.load
                 (get_local $var$6)
                )
               )
               (i32.store
                (get_local $var$6)
                (get_local $var$1)
               )
              )
              (set_local $var$2
               (get_local $var$1)
              )
             )
             (set_local $var$2
              (if (result i32)
               (get_local $var$4)
               (block (result i32)
                (set_local $var$1
                 (get_local $var$4)
                )
                (br $label$24)
               )
               (get_local $var$5)
              )
             )
            )
            (set_local $var$2
             (get_local $var$5)
            )
           )
          )
          (set_local $var$2
           (get_local $var$5)
          )
         )
        )
        (set_local $var$2
         (get_local $var$5)
        )
       )
      )
      (set_local $var$2
       (get_local $var$5)
      )
     )
    )
    (set_local $var$2
     (i32.add
      (get_local $var$6)
      (i32.const 1)
     )
    )
   )
   (if
    (i32.lt_u
     (get_local $var$2)
     (i32.add
      (i32.load
       (get_local $var$0)
      )
      (i32.const -1)
     )
    )
    (block
     (set_local $var$6
      (get_local $var$2)
     )
     (br $label$2)
    )
   )
  )
 )
 (func $16 (; 21 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 f32)
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (tee_local $var$5
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (tee_local $var$7
          (i32.add
           (tee_local $var$9
            (i32.load
             (get_local $var$0)
            )
           )
           (i32.const -1)
          )
         )
         (i32.const 2)
        )
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$2
   (get_local $var$5)
  )
  (loop $label$2
   (set_local $var$4
    (call $38
     (get_local $var$1)
     (get_local $var$1)
     (get_local $var$0)
    )
   )
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$4)
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$4)
      )
     )
     (i32.store
      (get_local $var$4)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$2)
    )
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (get_local $var$5)
     )
    )
   )
   (return)
  )
  (set_local $var$10
   (f32.convert_u/i32
    (i32.load
     (get_local $var$0)
    )
   )
  )
  (set_local $var$8
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$2
   (get_local $var$1)
  )
  (loop $label$7
   (f32.store
    (tee_local $var$3
     (i32.add
      (get_local $var$2)
      (i32.const 8)
     )
    )
    (f32.sub
     (f32.load
      (get_local $var$3)
     )
     (f32.mul
      (f32.load
       (get_local $var$8)
      )
      (get_local $var$10)
     )
    )
   )
   (br_if $label$7
    (tee_local $var$2
     (i32.load
      (get_local $var$2)
     )
    )
   )
  )
  (set_local $var$4
   (i32.add
    (get_local $var$0)
    (i32.const 12)
   )
  )
  (set_local $var$2
   (get_local $var$5)
  )
  (loop $label$8
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (tee_local $var$6
     (call $38
      (get_local $var$1)
      (get_local $var$4)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$6)
      )
     )
     (i32.store
      (get_local $var$6)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$8)
    )
   )
  )
  (set_local $var$2
   (i32.load
    (get_local $var$0)
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (get_local $var$5)
     )
    )
   )
   (return)
  )
  (set_local $var$4
   (i32.add
    (i32.add
     (get_local $var$0)
     (i32.const 12)
    )
    (i32.shl
     (get_local $var$2)
     (i32.const 2)
    )
   )
  )
  (set_local $var$2
   (get_local $var$5)
  )
  (loop $label$13
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (tee_local $var$6
     (call $38
      (get_local $var$1)
      (get_local $var$4)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$6)
      )
     )
     (i32.store
      (get_local $var$6)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$13)
    )
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (get_local $var$5)
     )
    )
   )
   (return)
  )
  (set_local $var$10
   (f32.convert_u/i32
    (tee_local $var$4
     (i32.load
      (get_local $var$0)
     )
    )
   )
  )
  (set_local $var$2
   (get_local $var$1)
  )
  (loop $label$18
   (f32.store
    (tee_local $var$3
     (i32.add
      (get_local $var$2)
      (i32.const 8)
     )
    )
    (f32.add
     (f32.load
      (get_local $var$3)
     )
     (f32.mul
      (f32.load
       (get_local $var$8)
      )
      (get_local $var$10)
     )
    )
   )
   (br_if $label$18
    (tee_local $var$2
     (i32.load
      (get_local $var$2)
     )
    )
   )
  )
  (set_local $var$4
   (i32.add
    (i32.add
     (get_local $var$0)
     (i32.const 12)
    )
    (i32.shl
     (i32.add
      (get_local $var$4)
      (get_local $var$7)
     )
     (i32.const 2)
    )
   )
  )
  (set_local $var$2
   (get_local $var$5)
  )
  (loop $label$19
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (tee_local $var$7
     (call $38
      (get_local $var$1)
      (get_local $var$4)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$7)
      )
     )
     (i32.store
      (get_local $var$7)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$19)
    )
   )
  )
  (set_local $var$1
   (i32.load
    (get_local $var$0)
   )
  )
  (if
   (i32.eqz
    (tee_local $var$2
     (i32.load
      (get_local $var$5)
     )
    )
   )
   (return)
  )
  (set_local $var$3
   (i32.add
    (i32.add
     (get_local $var$0)
     (i32.shl
      (i32.add
       (get_local $var$9)
       (get_local $var$1)
      )
      (i32.const 2)
     )
    )
    (i32.const 4)
   )
  )
  (loop $label$24
   (set_local $var$1
    (i32.load
     (get_local $var$2)
    )
   )
   (if
    (tee_local $var$4
     (call $38
      (get_local $var$2)
      (get_local $var$3)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$5)
      (get_local $var$1)
     )
     (i32.store
      (get_local $var$2)
      (i32.load
       (get_local $var$4)
      )
     )
     (i32.store
      (get_local $var$4)
      (get_local $var$2)
     )
    )
    (set_local $var$5
     (get_local $var$2)
    )
   )
   (if
    (get_local $var$1)
    (block
     (set_local $var$2
      (get_local $var$1)
     )
     (br $label$24)
    )
   )
  )
 )
 (func $17 (; 22 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 i32)
  (local $var$11 f32)
  (if
   (i32.le_u
    (i32.add
     (i32.load
      (tee_local $var$9
       (i32.add
        (get_local $var$0)
        (i32.const 4)
       )
      )
     )
     (i32.const -1)
    )
    (i32.const 1)
   )
   (return)
  )
  (set_local $var$8
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$6
   (i32.const 1)
  )
  (set_local $var$1
   (i32.load
    (get_local $var$0)
   )
  )
  (loop $label$2
   (block $label$3
    (block $label$4
     (br_if $label$4
      (i32.eqz
       (tee_local $var$4
        (i32.load
         (tee_local $var$2
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (i32.mul
             (get_local $var$1)
             (get_local $var$6)
            )
            (i32.const 2)
           )
          )
         )
        )
       )
      )
     )
     (set_local $var$1
      (get_local $var$2)
     )
     (loop $label$5
      (set_local $var$3
       (call $38
        (get_local $var$4)
        (get_local $var$4)
        (get_local $var$0)
       )
      )
      (set_local $var$2
       (i32.load
        (get_local $var$4)
       )
      )
      (if
       (get_local $var$3)
       (block
        (i32.store
         (get_local $var$1)
         (get_local $var$2)
        )
        (i32.store
         (get_local $var$4)
         (i32.load
          (get_local $var$3)
         )
        )
        (i32.store
         (get_local $var$3)
         (get_local $var$4)
        )
       )
       (set_local $var$1
        (get_local $var$4)
       )
      )
      (if
       (get_local $var$2)
       (block
        (set_local $var$4
         (get_local $var$2)
        )
        (br $label$5)
       )
      )
     )
     (set_local $var$4
      (i32.load
       (tee_local $var$2
        (i32.add
         (i32.add
          (get_local $var$0)
          (i32.const 12)
         )
         (i32.shl
          (tee_local $var$3
           (i32.mul
            (tee_local $var$1
             (i32.load
              (get_local $var$0)
             )
            )
            (get_local $var$6)
           )
          )
          (i32.const 2)
         )
        )
       )
      )
     )
     (set_local $var$5
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.shl
         (get_local $var$3)
         (i32.const 2)
        )
       )
       (i32.const 16)
      )
     )
     (br_if $label$4
      (i32.eqz
       (get_local $var$4)
      )
     )
     (set_local $var$1
      (get_local $var$2)
     )
     (loop $label$9
      (set_local $var$2
       (i32.load
        (get_local $var$4)
       )
      )
      (if
       (tee_local $var$3
        (call $38
         (get_local $var$4)
         (get_local $var$5)
         (get_local $var$0)
        )
       )
       (block
        (i32.store
         (get_local $var$1)
         (get_local $var$2)
        )
        (i32.store
         (get_local $var$4)
         (i32.load
          (get_local $var$3)
         )
        )
        (i32.store
         (get_local $var$3)
         (get_local $var$4)
        )
       )
       (set_local $var$1
        (get_local $var$4)
       )
      )
      (if
       (get_local $var$2)
       (block
        (set_local $var$4
         (get_local $var$2)
        )
        (br $label$9)
       )
      )
     )
     (set_local $var$4
      (i32.load
       (tee_local $var$1
        (i32.add
         (i32.add
          (get_local $var$0)
          (i32.const 12)
         )
         (i32.shl
          (i32.mul
           (tee_local $var$7
            (i32.load
             (get_local $var$0)
            )
           )
           (get_local $var$6)
          )
          (i32.const 2)
         )
        )
       )
      )
     )
     (set_local $var$10
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.shl
         (tee_local $var$3
          (i32.mul
           (get_local $var$7)
           (tee_local $var$5
            (i32.add
             (get_local $var$6)
             (i32.const 1)
            )
           )
          )
         )
         (i32.const 2)
        )
       )
       (i32.const 16)
      )
     )
     (if
      (get_local $var$4)
      (block
       (loop $label$14
        (set_local $var$2
         (i32.load
          (get_local $var$4)
         )
        )
        (if
         (tee_local $var$3
          (call $38
           (get_local $var$4)
           (get_local $var$10)
           (get_local $var$0)
          )
         )
         (block
          (i32.store
           (get_local $var$1)
           (get_local $var$2)
          )
          (i32.store
           (get_local $var$4)
           (i32.load
            (get_local $var$3)
           )
          )
          (i32.store
           (get_local $var$3)
           (get_local $var$4)
          )
         )
         (set_local $var$1
          (get_local $var$4)
         )
        )
        (if
         (get_local $var$2)
         (block
          (set_local $var$4
           (get_local $var$2)
          )
          (br $label$14)
         )
        )
       )
       (set_local $var$2
        (i32.add
         (i32.add
          (get_local $var$0)
          (i32.const 12)
         )
         (i32.shl
          (i32.mul
           (tee_local $var$1
            (i32.load
             (get_local $var$0)
            )
           )
           (get_local $var$6)
          )
          (i32.const 2)
         )
        )
       )
       (set_local $var$3
        (i32.mul
         (get_local $var$1)
         (get_local $var$5)
        )
       )
      )
      (block
       (set_local $var$2
        (get_local $var$1)
       )
       (set_local $var$1
        (get_local $var$7)
       )
      )
     )
     (set_local $var$4
      (get_local $var$5)
     )
     (br $label$3)
    )
    (set_local $var$3
     (i32.mul
      (get_local $var$1)
      (tee_local $var$4
       (i32.add
        (get_local $var$6)
        (i32.const 1)
       )
      )
     )
    )
   )
   (set_local $var$7
    (i32.add
     (i32.add
      (get_local $var$0)
      (i32.const 12)
     )
     (i32.shl
      (get_local $var$3)
      (i32.const 2)
     )
    )
   )
   (if
    (tee_local $var$5
     (i32.load
      (get_local $var$2)
     )
    )
    (block
     (set_local $var$1
      (get_local $var$5)
     )
     (loop $label$20
      (set_local $var$3
       (i32.load
        (get_local $var$1)
       )
      )
      (if
       (tee_local $var$5
        (call $38
         (get_local $var$1)
         (get_local $var$7)
         (get_local $var$0)
        )
       )
       (block
        (i32.store
         (get_local $var$2)
         (get_local $var$3)
        )
        (i32.store
         (get_local $var$1)
         (i32.load
          (get_local $var$5)
         )
        )
        (i32.store
         (get_local $var$5)
         (get_local $var$1)
        )
       )
       (set_local $var$2
        (get_local $var$1)
       )
      )
      (if
       (get_local $var$3)
       (block
        (set_local $var$1
         (get_local $var$3)
        )
        (br $label$20)
       )
      )
     )
     (set_local $var$3
      (i32.mul
       (tee_local $var$1
        (i32.load
         (get_local $var$0)
        )
       )
       (get_local $var$4)
      )
     )
    )
   )
   (if
    (tee_local $var$2
     (i32.load
      (tee_local $var$5
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.shl
          (i32.add
           (get_local $var$1)
           (get_local $var$3)
          )
          (i32.const 2)
         )
        )
        (i32.const 8)
       )
      )
     )
    )
    (block
     (set_local $var$11
      (f32.convert_u/i32
       (get_local $var$1)
      )
     )
     (loop $label$25
      (f32.store
       (tee_local $var$3
        (i32.add
         (get_local $var$2)
         (i32.const 8)
        )
       )
       (f32.sub
        (f32.load
         (get_local $var$3)
        )
        (f32.mul
         (f32.load
          (get_local $var$8)
         )
         (get_local $var$11)
        )
       )
      )
      (br_if $label$25
       (tee_local $var$2
        (i32.load
         (get_local $var$2)
        )
       )
      )
     )
    )
   )
   (if
    (tee_local $var$3
     (i32.load
      (tee_local $var$2
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.mul
          (get_local $var$1)
          (get_local $var$6)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (loop $label$27
      (set_local $var$3
       (i32.load
        (get_local $var$1)
       )
      )
      (if
       (tee_local $var$6
        (call $38
         (get_local $var$1)
         (get_local $var$5)
         (get_local $var$0)
        )
       )
       (block
        (i32.store
         (get_local $var$2)
         (get_local $var$3)
        )
        (i32.store
         (get_local $var$1)
         (i32.load
          (get_local $var$6)
         )
        )
        (i32.store
         (get_local $var$6)
         (get_local $var$1)
        )
       )
       (set_local $var$2
        (get_local $var$1)
       )
      )
      (if
       (get_local $var$3)
       (block
        (set_local $var$1
         (get_local $var$3)
        )
        (br $label$27)
       )
      )
     )
     (set_local $var$5
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.shl
         (i32.add
          (tee_local $var$1
           (i32.load
            (get_local $var$0)
           )
          )
          (i32.mul
           (get_local $var$1)
           (get_local $var$4)
          )
         )
         (i32.const 2)
        )
       )
       (i32.const 8)
      )
     )
    )
   )
   (if
    (tee_local $var$2
     (i32.load
      (get_local $var$5)
     )
    )
    (block
     (set_local $var$11
      (f32.convert_u/i32
       (get_local $var$1)
      )
     )
     (loop $label$32
      (f32.store
       (tee_local $var$3
        (i32.add
         (get_local $var$2)
         (i32.const 8)
        )
       )
       (f32.add
        (f32.load
         (get_local $var$3)
        )
        (f32.mul
         (f32.load
          (get_local $var$8)
         )
         (get_local $var$11)
        )
       )
      )
      (br_if $label$32
       (tee_local $var$2
        (i32.load
         (get_local $var$2)
        )
       )
      )
     )
    )
   )
   (if
    (i32.lt_u
     (get_local $var$4)
     (i32.add
      (i32.load
       (get_local $var$9)
      )
      (i32.const -1)
     )
    )
    (block
     (set_local $var$6
      (get_local $var$4)
     )
     (br $label$2)
    )
   )
  )
 )
 (func $18 (; 23 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 i32)
  (local $var$11 i32)
  (if
   (i32.le_u
    (i32.add
     (tee_local $var$4
      (i32.load
       (tee_local $var$10
        (i32.add
         (get_local $var$0)
         (i32.const 4)
        )
       )
      )
     )
     (i32.const -1)
    )
    (i32.const 1)
   )
   (return)
  )
  (set_local $var$7
   (i32.const 1)
  )
  (set_local $var$1
   (i32.load
    (get_local $var$0)
   )
  )
  (loop $label$2
   (set_local $var$9
    (i32.add
     (get_local $var$7)
     (i32.const 1)
    )
   )
   (if
    (i32.gt_u
     (i32.add
      (get_local $var$1)
      (i32.const -1)
     )
     (i32.const 1)
    )
    (block
     (set_local $var$5
      (i32.const 1)
     )
     (loop $label$4
      (block $label$5
       (block $label$6
        (set_local $var$4
         (if (result i32)
          (tee_local $var$4
           (i32.load
            (tee_local $var$3
             (i32.add
              (i32.add
               (get_local $var$0)
               (i32.const 12)
              )
              (i32.shl
               (i32.add
                (i32.mul
                 (get_local $var$1)
                 (get_local $var$7)
                )
                (get_local $var$5)
               )
               (i32.const 2)
              )
             )
            )
           )
          )
          (block (result i32)
           (set_local $var$1
            (get_local $var$4)
           )
           (set_local $var$4
            (get_local $var$3)
           )
           (loop $label$8
            (set_local $var$3
             (call $38
              (get_local $var$1)
              (get_local $var$1)
              (get_local $var$0)
             )
            )
            (set_local $var$2
             (i32.load
              (get_local $var$1)
             )
            )
            (if
             (get_local $var$3)
             (block
              (i32.store
               (get_local $var$4)
               (get_local $var$2)
              )
              (i32.store
               (get_local $var$1)
               (i32.load
                (get_local $var$3)
               )
              )
              (i32.store
               (get_local $var$3)
               (get_local $var$1)
              )
             )
             (set_local $var$4
              (get_local $var$1)
             )
            )
            (if
             (get_local $var$2)
             (block
              (set_local $var$1
               (get_local $var$2)
              )
              (br $label$8)
             )
            )
           )
           (set_local $var$4
            (i32.load
             (tee_local $var$3
              (i32.add
               (i32.add
                (get_local $var$0)
                (i32.const 12)
               )
               (i32.shl
                (i32.add
                 (tee_local $var$2
                  (i32.mul
                   (tee_local $var$1
                    (i32.load
                     (get_local $var$0)
                    )
                   )
                   (get_local $var$7)
                  )
                 )
                 (get_local $var$5)
                )
                (i32.const 2)
               )
              )
             )
            )
           )
           (set_local $var$6
            (i32.add
             (i32.add
              (get_local $var$0)
              (i32.const 12)
             )
             (i32.shl
              (i32.add
               (get_local $var$2)
               (tee_local $var$2
                (i32.add
                 (get_local $var$5)
                 (i32.const 1)
                )
               )
              )
              (i32.const 2)
             )
            )
           )
           (if (result i32)
            (get_local $var$4)
            (block (result i32)
             (set_local $var$1
              (get_local $var$4)
             )
             (set_local $var$4
              (get_local $var$3)
             )
             (loop $label$13
              (set_local $var$3
               (i32.load
                (get_local $var$1)
               )
              )
              (if
               (tee_local $var$8
                (call $38
                 (get_local $var$1)
                 (get_local $var$6)
                 (get_local $var$0)
                )
               )
               (block
                (i32.store
                 (get_local $var$4)
                 (get_local $var$3)
                )
                (i32.store
                 (get_local $var$1)
                 (i32.load
                  (get_local $var$8)
                 )
                )
                (i32.store
                 (get_local $var$8)
                 (get_local $var$1)
                )
               )
               (set_local $var$4
                (get_local $var$1)
               )
              )
              (if
               (get_local $var$3)
               (block
                (set_local $var$1
                 (get_local $var$3)
                )
                (br $label$13)
               )
              )
             )
             (set_local $var$1
              (i32.load
               (tee_local $var$4
                (i32.add
                 (i32.add
                  (get_local $var$0)
                  (i32.const 12)
                 )
                 (i32.shl
                  (i32.add
                   (i32.mul
                    (tee_local $var$8
                     (i32.load
                      (get_local $var$0)
                     )
                    )
                    (get_local $var$7)
                   )
                   (get_local $var$5)
                  )
                  (i32.const 2)
                 )
                )
               )
              )
             )
             (set_local $var$11
              (i32.add
               (i32.add
                (get_local $var$0)
                (i32.const 12)
               )
               (i32.shl
                (i32.add
                 (tee_local $var$6
                  (i32.mul
                   (get_local $var$8)
                   (get_local $var$9)
                  )
                 )
                 (get_local $var$2)
                )
                (i32.const 2)
               )
              )
             )
             (if (result i32)
              (get_local $var$1)
              (block (result i32)
               (loop $label$18
                (set_local $var$3
                 (i32.load
                  (get_local $var$1)
                 )
                )
                (if
                 (tee_local $var$6
                  (call $38
                   (get_local $var$1)
                   (get_local $var$11)
                   (get_local $var$0)
                  )
                 )
                 (block
                  (i32.store
                   (get_local $var$4)
                   (get_local $var$3)
                  )
                  (i32.store
                   (get_local $var$1)
                   (i32.load
                    (get_local $var$6)
                   )
                  )
                  (i32.store
                   (get_local $var$6)
                   (get_local $var$1)
                  )
                 )
                 (set_local $var$4
                  (get_local $var$1)
                 )
                )
                (if
                 (get_local $var$3)
                 (block
                  (set_local $var$1
                   (get_local $var$3)
                  )
                  (br $label$18)
                 )
                )
               )
               (set_local $var$4
                (get_local $var$2)
               )
               (set_local $var$2
                (tee_local $var$1
                 (i32.load
                  (get_local $var$0)
                 )
                )
               )
               (set_local $var$1
                (i32.add
                 (i32.add
                  (get_local $var$0)
                  (i32.const 12)
                 )
                 (i32.shl
                  (i32.add
                   (i32.mul
                    (get_local $var$1)
                    (get_local $var$7)
                   )
                   (get_local $var$5)
                  )
                  (i32.const 2)
                 )
                )
               )
               (br $label$6)
              )
              (block (result i32)
               (set_local $var$3
                (get_local $var$4)
               )
               (set_local $var$1
                (get_local $var$8)
               )
               (get_local $var$2)
              )
             )
            )
            (block (result i32)
             (set_local $var$4
              (get_local $var$2)
             )
             (set_local $var$2
              (get_local $var$1)
             )
             (set_local $var$1
              (get_local $var$3)
             )
             (br $label$6)
            )
           )
          )
          (block (result i32)
           (set_local $var$4
            (i32.add
             (get_local $var$5)
             (i32.const 1)
            )
           )
           (set_local $var$2
            (get_local $var$1)
           )
           (set_local $var$1
            (get_local $var$3)
           )
           (br $label$6)
          )
         )
        )
        (br $label$5)
       )
       (set_local $var$8
        (i32.add
         (i32.add
          (get_local $var$0)
          (i32.const 12)
         )
         (i32.shl
          (i32.add
           (tee_local $var$6
            (i32.mul
             (get_local $var$2)
             (get_local $var$9)
            )
           )
           (get_local $var$5)
          )
          (i32.const 2)
         )
        )
       )
       (if
        (tee_local $var$3
         (i32.load
          (get_local $var$1)
         )
        )
        (block
         (set_local $var$2
          (get_local $var$3)
         )
         (loop $label$26
          (set_local $var$3
           (i32.load
            (get_local $var$2)
           )
          )
          (if
           (tee_local $var$6
            (call $38
             (get_local $var$2)
             (get_local $var$8)
             (get_local $var$0)
            )
           )
           (block
            (i32.store
             (get_local $var$1)
             (get_local $var$3)
            )
            (i32.store
             (get_local $var$2)
             (i32.load
              (get_local $var$6)
             )
            )
            (i32.store
             (get_local $var$6)
             (get_local $var$2)
            )
           )
           (set_local $var$1
            (get_local $var$2)
           )
          )
          (if
           (get_local $var$3)
           (block
            (set_local $var$2
             (get_local $var$3)
            )
            (br $label$26)
           )
          )
         )
         (set_local $var$3
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (i32.add
             (i32.mul
              (tee_local $var$1
               (i32.load
                (get_local $var$0)
               )
              )
              (get_local $var$7)
             )
             (get_local $var$5)
            )
            (i32.const 2)
           )
          )
         )
         (set_local $var$6
          (i32.mul
           (get_local $var$1)
           (get_local $var$9)
          )
         )
        )
        (block
         (set_local $var$3
          (get_local $var$1)
         )
         (set_local $var$1
          (get_local $var$2)
         )
        )
       )
      )
      (set_local $var$6
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.shl
          (i32.add
           (get_local $var$5)
           (get_local $var$6)
          )
          (i32.const 2)
         )
        )
        (i32.const 8)
       )
      )
      (if
       (tee_local $var$2
        (i32.load
         (get_local $var$3)
        )
       )
       (block
        (set_local $var$1
         (get_local $var$3)
        )
        (loop $label$32
         (set_local $var$3
          (i32.load
           (get_local $var$2)
          )
         )
         (if
          (tee_local $var$5
           (call $38
            (get_local $var$2)
            (get_local $var$6)
            (get_local $var$0)
           )
          )
          (block
           (i32.store
            (get_local $var$1)
            (get_local $var$3)
           )
           (i32.store
            (get_local $var$2)
            (i32.load
             (get_local $var$5)
            )
           )
           (i32.store
            (get_local $var$5)
            (get_local $var$2)
           )
          )
          (set_local $var$1
           (get_local $var$2)
          )
         )
         (if
          (get_local $var$3)
          (block
           (set_local $var$2
            (get_local $var$3)
           )
           (br $label$32)
          )
         )
        )
        (set_local $var$1
         (i32.load
          (get_local $var$0)
         )
        )
       )
      )
      (if
       (i32.lt_u
        (get_local $var$4)
        (i32.add
         (get_local $var$1)
         (i32.const -1)
        )
       )
       (block
        (set_local $var$5
         (get_local $var$4)
        )
        (br $label$4)
       )
      )
     )
     (set_local $var$2
      (i32.load
       (get_local $var$10)
      )
     )
    )
    (set_local $var$2
     (get_local $var$4)
    )
   )
   (set_local $var$4
    (get_local $var$1)
   )
   (if
    (i32.lt_u
     (get_local $var$9)
     (i32.add
      (get_local $var$2)
      (i32.const -1)
     )
    )
    (block
     (set_local $var$7
      (get_local $var$9)
     )
     (set_local $var$4
      (get_local $var$2)
     )
     (br $label$2)
    )
   )
  )
 )
 (func $19 (; 24 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 i32)
  (local $var$11 i32)
  (local $var$12 f32)
  (set_local $var$1
   (i32.load
    (get_local $var$0)
   )
  )
  (if
   (i32.le_u
    (i32.add
     (i32.load
      (tee_local $var$10
       (i32.add
        (get_local $var$0)
        (i32.const 4)
       )
      )
     )
     (i32.const -1)
    )
    (i32.const 1)
   )
   (return)
  )
  (set_local $var$7
   (i32.add
    (get_local $var$1)
    (i32.const -1)
   )
  )
  (set_local $var$9
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$11
   (i32.add
    (get_local $var$1)
    (i32.const -2)
   )
  )
  (set_local $var$6
   (i32.const 1)
  )
  (loop $label$2
   (block $label$3
    (block $label$4
     (block $label$5
      (br_if $label$5
       (i32.eqz
        (tee_local $var$2
         (i32.load
          (tee_local $var$4
           (i32.add
            (i32.add
             (get_local $var$0)
             (i32.const 12)
            )
            (i32.shl
             (i32.add
              (i32.mul
               (get_local $var$1)
               (get_local $var$6)
              )
              (get_local $var$7)
             )
             (i32.const 2)
            )
           )
          )
         )
        )
       )
      )
      (set_local $var$1
       (get_local $var$4)
      )
      (loop $label$6
       (set_local $var$3
        (call $38
         (get_local $var$2)
         (get_local $var$2)
         (get_local $var$0)
        )
       )
       (set_local $var$4
        (i32.load
         (get_local $var$2)
        )
       )
       (if
        (get_local $var$3)
        (block
         (i32.store
          (get_local $var$1)
          (get_local $var$4)
         )
         (i32.store
          (get_local $var$2)
          (i32.load
           (get_local $var$3)
          )
         )
         (i32.store
          (get_local $var$3)
          (get_local $var$2)
         )
        )
        (set_local $var$1
         (get_local $var$2)
        )
       )
       (if
        (get_local $var$4)
        (block
         (set_local $var$2
          (get_local $var$4)
         )
         (br $label$6)
        )
       )
      )
      (set_local $var$2
       (if (result i32)
        (tee_local $var$1
         (i32.load
          (tee_local $var$4
           (i32.add
            (i32.add
             (get_local $var$0)
             (i32.const 12)
            )
            (i32.shl
             (i32.add
              (tee_local $var$3
               (i32.mul
                (tee_local $var$2
                 (i32.load
                  (get_local $var$0)
                 )
                )
                (get_local $var$6)
               )
              )
              (get_local $var$7)
             )
             (i32.const 2)
            )
           )
          )
         )
        )
        (block (result i32)
         (set_local $var$12
          (f32.convert_u/i32
           (get_local $var$2)
          )
         )
         (set_local $var$2
          (get_local $var$1)
         )
         (loop $label$11
          (f32.store
           (tee_local $var$5
            (i32.add
             (get_local $var$2)
             (i32.const 8)
            )
           )
           (f32.sub
            (f32.load
             (get_local $var$5)
            )
            (f32.mul
             (f32.load
              (get_local $var$9)
             )
             (get_local $var$12)
            )
           )
          )
          (br_if $label$11
           (tee_local $var$2
            (i32.load
             (get_local $var$2)
            )
           )
          )
         )
         (set_local $var$5
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (get_local $var$3)
            (i32.const 2)
           )
          )
         )
         (set_local $var$2
          (get_local $var$1)
         )
         (set_local $var$1
          (get_local $var$4)
         )
         (loop $label$12
          (set_local $var$4
           (i32.load
            (get_local $var$2)
           )
          )
          (if
           (tee_local $var$3
            (call $38
             (get_local $var$2)
             (get_local $var$5)
             (get_local $var$0)
            )
           )
           (block
            (i32.store
             (get_local $var$1)
             (get_local $var$4)
            )
            (i32.store
             (get_local $var$2)
             (i32.load
              (get_local $var$3)
             )
            )
            (i32.store
             (get_local $var$3)
             (get_local $var$2)
            )
           )
           (set_local $var$1
            (get_local $var$2)
           )
          )
          (if
           (get_local $var$4)
           (block
            (set_local $var$2
             (get_local $var$4)
            )
            (br $label$12)
           )
          )
         )
         (set_local $var$2
          (i32.load
           (tee_local $var$1
            (i32.add
             (i32.add
              (get_local $var$0)
              (i32.const 12)
             )
             (i32.shl
              (i32.add
               (i32.mul
                (tee_local $var$4
                 (i32.load
                  (get_local $var$0)
                 )
                )
                (get_local $var$6)
               )
               (get_local $var$7)
              )
              (i32.const 2)
             )
            )
           )
          )
         )
         (set_local $var$8
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (i32.mul
             (get_local $var$4)
             (tee_local $var$4
              (i32.add
               (get_local $var$6)
               (i32.const 1)
              )
             )
            )
            (i32.const 2)
           )
          )
         )
         (if (result i32)
          (get_local $var$2)
          (block (result i32)
           (loop $label$17
            (set_local $var$3
             (i32.load
              (get_local $var$2)
             )
            )
            (if
             (tee_local $var$5
              (call $38
               (get_local $var$2)
               (get_local $var$8)
               (get_local $var$0)
              )
             )
             (block
              (i32.store
               (get_local $var$1)
               (get_local $var$3)
              )
              (i32.store
               (get_local $var$2)
               (i32.load
                (get_local $var$5)
               )
              )
              (i32.store
               (get_local $var$5)
               (get_local $var$2)
              )
             )
             (set_local $var$1
              (get_local $var$2)
             )
            )
            (if
             (get_local $var$3)
             (block
              (set_local $var$2
               (get_local $var$3)
              )
              (br $label$17)
             )
            )
           )
           (set_local $var$2
            (get_local $var$4)
           )
           (set_local $var$5
            (tee_local $var$1
             (i32.load
              (get_local $var$0)
             )
            )
           )
           (set_local $var$4
            (i32.add
             (i32.add
              (get_local $var$0)
              (i32.const 12)
             )
             (i32.shl
              (i32.add
               (i32.mul
                (get_local $var$1)
                (get_local $var$6)
               )
               (get_local $var$7)
              )
              (i32.const 2)
             )
            )
           )
           (br $label$4)
          )
          (get_local $var$4)
         )
        )
        (block (result i32)
         (set_local $var$1
          (get_local $var$2)
         )
         (br $label$5)
        )
       )
      )
      (br $label$3)
     )
     (set_local $var$2
      (i32.add
       (get_local $var$6)
       (i32.const 1)
      )
     )
     (set_local $var$5
      (get_local $var$1)
     )
    )
    (if
     (tee_local $var$3
      (i32.load
       (get_local $var$4)
      )
     )
     (block
      (set_local $var$12
       (f32.convert_u/i32
        (get_local $var$5)
       )
      )
      (set_local $var$1
       (get_local $var$3)
      )
      (loop $label$24
       (f32.store
        (tee_local $var$8
         (i32.add
          (get_local $var$1)
          (i32.const 8)
         )
        )
        (f32.add
         (f32.load
          (get_local $var$8)
         )
         (f32.mul
          (f32.load
           (get_local $var$9)
          )
          (get_local $var$12)
         )
        )
       )
       (br_if $label$24
        (tee_local $var$1
         (i32.load
          (get_local $var$1)
         )
        )
       )
      )
      (set_local $var$8
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (i32.mul
           (get_local $var$5)
           (get_local $var$2)
          )
          (get_local $var$7)
         )
         (i32.const 2)
        )
       )
      )
      (set_local $var$1
       (get_local $var$3)
      )
      (loop $label$25
       (set_local $var$3
        (i32.load
         (get_local $var$1)
        )
       )
       (if
        (tee_local $var$5
         (call $38
          (get_local $var$1)
          (get_local $var$8)
          (get_local $var$0)
         )
        )
        (block
         (i32.store
          (get_local $var$4)
          (get_local $var$3)
         )
         (i32.store
          (get_local $var$1)
          (i32.load
           (get_local $var$5)
          )
         )
         (i32.store
          (get_local $var$5)
          (get_local $var$1)
         )
        )
        (set_local $var$4
         (get_local $var$1)
        )
       )
       (if
        (get_local $var$3)
        (block
         (set_local $var$1
          (get_local $var$3)
         )
         (br $label$25)
        )
       )
      )
      (set_local $var$1
       (i32.load
        (tee_local $var$4
         (i32.add
          (i32.add
           (get_local $var$0)
           (i32.const 12)
          )
          (i32.shl
           (i32.add
            (i32.mul
             (tee_local $var$3
              (i32.load
               (get_local $var$0)
              )
             )
             (get_local $var$6)
            )
            (get_local $var$7)
           )
           (i32.const 2)
          )
         )
        )
       )
      )
      (set_local $var$5
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (get_local $var$11)
          (i32.mul
           (get_local $var$3)
           (get_local $var$2)
          )
         )
         (i32.const 2)
        )
       )
      )
      (if
       (get_local $var$1)
       (loop $label$30
        (set_local $var$3
         (i32.load
          (get_local $var$1)
         )
        )
        (if
         (tee_local $var$6
          (call $38
           (get_local $var$1)
           (get_local $var$5)
           (get_local $var$0)
          )
         )
         (block
          (i32.store
           (get_local $var$4)
           (get_local $var$3)
          )
          (i32.store
           (get_local $var$1)
           (i32.load
            (get_local $var$6)
           )
          )
          (i32.store
           (get_local $var$6)
           (get_local $var$1)
          )
         )
         (set_local $var$4
          (get_local $var$1)
         )
        )
        (if
         (get_local $var$3)
         (block
          (set_local $var$1
           (get_local $var$3)
          )
          (br $label$30)
         )
        )
       )
      )
     )
    )
   )
   (if
    (i32.lt_u
     (get_local $var$2)
     (i32.add
      (i32.load
       (get_local $var$10)
      )
      (i32.const -1)
     )
    )
    (block
     (set_local $var$6
      (get_local $var$2)
     )
     (set_local $var$1
      (i32.load
       (get_local $var$0)
      )
     )
     (br $label$2)
    )
   )
  )
 )
 (func $20 (; 25 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 f32)
  (if
   (tee_local $var$2
    (i32.load
     (tee_local $var$3
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.const 12)
       )
       (i32.shl
        (i32.mul
         (tee_local $var$1
          (i32.load
           (get_local $var$0)
          )
         )
         (tee_local $var$6
          (i32.add
           (i32.load
            (tee_local $var$7
             (i32.add
              (get_local $var$0)
              (i32.const 4)
             )
            )
           )
           (i32.const -1)
          )
         )
        )
        (i32.const 2)
       )
      )
     )
    )
   )
   (block
    (set_local $var$1
     (get_local $var$2)
    )
    (loop $label$2
     (set_local $var$4
      (call $38
       (get_local $var$1)
       (get_local $var$1)
       (get_local $var$0)
      )
     )
     (set_local $var$2
      (i32.load
       (get_local $var$1)
      )
     )
     (if
      (get_local $var$4)
      (block
       (i32.store
        (get_local $var$3)
        (get_local $var$2)
       )
       (i32.store
        (get_local $var$1)
        (i32.load
         (get_local $var$4)
        )
       )
       (i32.store
        (get_local $var$4)
        (get_local $var$1)
       )
      )
      (set_local $var$3
       (get_local $var$1)
      )
     )
     (if
      (get_local $var$2)
      (block
       (set_local $var$1
        (get_local $var$2)
       )
       (br $label$2)
      )
     )
    )
    (set_local $var$1
     (i32.load
      (tee_local $var$2
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (tee_local $var$4
          (i32.mul
           (tee_local $var$3
            (i32.load
             (get_local $var$0)
            )
           )
           (get_local $var$6)
          )
         )
         (i32.const 2)
        )
       )
      )
     )
    )
    (set_local $var$5
     (i32.add
      (i32.add
       (get_local $var$0)
       (i32.shl
        (get_local $var$4)
        (i32.const 2)
       )
      )
      (i32.const 16)
     )
    )
    (if
     (get_local $var$1)
     (block
      (set_local $var$3
       (get_local $var$2)
      )
      (loop $label$7
       (set_local $var$2
        (i32.load
         (get_local $var$1)
        )
       )
       (if
        (tee_local $var$4
         (call $38
          (get_local $var$1)
          (get_local $var$5)
          (get_local $var$0)
         )
        )
        (block
         (i32.store
          (get_local $var$3)
          (get_local $var$2)
         )
         (i32.store
          (get_local $var$1)
          (i32.load
           (get_local $var$4)
          )
         )
         (i32.store
          (get_local $var$4)
          (get_local $var$1)
         )
        )
        (set_local $var$3
         (get_local $var$1)
        )
       )
       (if
        (get_local $var$2)
        (block
         (set_local $var$1
          (get_local $var$2)
         )
         (br $label$7)
        )
       )
      )
      (if
       (tee_local $var$3
        (i32.load
         (tee_local $var$2
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (i32.mul
             (tee_local $var$1
              (i32.load
               (get_local $var$0)
              )
             )
             (get_local $var$6)
            )
            (i32.const 2)
           )
          )
         )
        )
       )
       (block
        (set_local $var$8
         (f32.convert_u/i32
          (i32.load
           (get_local $var$7)
          )
         )
        )
        (set_local $var$4
         (i32.add
          (get_local $var$0)
          (i32.const 8)
         )
        )
        (set_local $var$1
         (get_local $var$3)
        )
        (loop $label$12
         (f32.store
          (tee_local $var$5
           (i32.add
            (get_local $var$1)
            (i32.const 12)
           )
          )
          (f32.sub
           (f32.load
            (get_local $var$5)
           )
           (f32.mul
            (f32.load
             (get_local $var$4)
            )
            (get_local $var$8)
           )
          )
         )
         (br_if $label$12
          (tee_local $var$1
           (i32.load
            (get_local $var$1)
           )
          )
         )
        )
        (set_local $var$5
         (i32.add
          (get_local $var$0)
          (i32.const 16)
         )
        )
        (set_local $var$1
         (get_local $var$3)
        )
        (set_local $var$3
         (get_local $var$2)
        )
        (loop $label$13
         (set_local $var$2
          (i32.load
           (get_local $var$1)
          )
         )
         (if
          (tee_local $var$4
           (call $38
            (get_local $var$1)
            (get_local $var$5)
            (get_local $var$0)
           )
          )
          (block
           (i32.store
            (get_local $var$3)
            (get_local $var$2)
           )
           (i32.store
            (get_local $var$1)
            (i32.load
             (get_local $var$4)
            )
           )
           (i32.store
            (get_local $var$4)
            (get_local $var$1)
           )
          )
          (set_local $var$3
           (get_local $var$1)
          )
         )
         (if
          (get_local $var$2)
          (block
           (set_local $var$1
            (get_local $var$2)
           )
           (br $label$13)
          )
         )
        )
        (set_local $var$5
         (i32.add
          (get_local $var$0)
          (i32.const 12)
         )
        )
        (if
         (tee_local $var$2
          (i32.load
           (tee_local $var$3
            (i32.add
             (i32.add
              (get_local $var$0)
              (i32.const 12)
             )
             (i32.shl
              (i32.mul
               (tee_local $var$1
                (i32.load
                 (get_local $var$0)
                )
               )
               (get_local $var$6)
              )
              (i32.const 2)
             )
            )
           )
          )
         )
         (block
          (set_local $var$1
           (get_local $var$2)
          )
          (loop $label$18
           (set_local $var$2
            (i32.load
             (get_local $var$1)
            )
           )
           (if
            (tee_local $var$4
             (call $38
              (get_local $var$1)
              (get_local $var$5)
              (get_local $var$0)
             )
            )
            (block
             (i32.store
              (get_local $var$3)
              (get_local $var$2)
             )
             (i32.store
              (get_local $var$1)
              (i32.load
               (get_local $var$4)
              )
             )
             (i32.store
              (get_local $var$4)
              (get_local $var$1)
             )
            )
            (set_local $var$3
             (get_local $var$1)
            )
           )
           (if
            (get_local $var$2)
            (block
             (set_local $var$1
              (get_local $var$2)
             )
             (br $label$18)
            )
           )
          )
          (set_local $var$1
           (i32.load
            (get_local $var$0)
           )
          )
         )
        )
       )
      )
     )
     (set_local $var$1
      (get_local $var$3)
     )
    )
   )
  )
  (if
   (tee_local $var$3
    (i32.load
     (tee_local $var$4
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.shl
         (get_local $var$1)
         (i32.const 2)
        )
       )
       (i32.const 8)
      )
     )
    )
   )
   (block
    (set_local $var$8
     (f32.convert_u/i32
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (i32.add
      (get_local $var$0)
      (i32.const 8)
     )
    )
    (loop $label$24
     (f32.store
      (tee_local $var$5
       (i32.add
        (get_local $var$3)
        (i32.const 8)
       )
      )
      (f32.sub
       (f32.load
        (get_local $var$5)
       )
       (f32.mul
        (f32.load
         (get_local $var$2)
        )
        (get_local $var$8)
       )
      )
     )
     (br_if $label$24
      (tee_local $var$3
       (i32.load
        (get_local $var$3)
       )
      )
     )
    )
   )
  )
  (if
   (tee_local $var$2
    (i32.load
     (tee_local $var$3
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.const 12)
       )
       (i32.shl
        (i32.mul
         (get_local $var$1)
         (get_local $var$6)
        )
        (i32.const 2)
       )
      )
     )
    )
   )
   (block
    (set_local $var$1
     (get_local $var$2)
    )
    (loop $label$26
     (set_local $var$2
      (i32.load
       (get_local $var$1)
      )
     )
     (if
      (tee_local $var$5
       (call $38
        (get_local $var$1)
        (get_local $var$4)
        (get_local $var$0)
       )
      )
      (block
       (i32.store
        (get_local $var$3)
        (get_local $var$2)
       )
       (i32.store
        (get_local $var$1)
        (i32.load
         (get_local $var$5)
        )
       )
       (i32.store
        (get_local $var$5)
        (get_local $var$1)
       )
      )
      (set_local $var$3
       (get_local $var$1)
      )
     )
     (if
      (get_local $var$2)
      (block
       (set_local $var$1
        (get_local $var$2)
       )
       (br $label$26)
      )
     )
    )
    (set_local $var$4
     (i32.add
      (i32.add
       (get_local $var$0)
       (i32.shl
        (tee_local $var$3
         (i32.load
          (get_local $var$0)
         )
        )
        (i32.const 2)
       )
      )
      (i32.const 8)
     )
    )
   )
   (set_local $var$3
    (get_local $var$1)
   )
  )
  (if
   (tee_local $var$1
    (i32.load
     (get_local $var$4)
    )
   )
   (block
    (set_local $var$8
     (f32.convert_u/i32
      (get_local $var$3)
     )
    )
    (set_local $var$2
     (i32.add
      (get_local $var$0)
      (i32.const 8)
     )
    )
    (loop $label$32
     (f32.store
      (tee_local $var$4
       (i32.add
        (get_local $var$1)
        (i32.const 8)
       )
      )
      (f32.add
       (f32.load
        (get_local $var$4)
       )
       (f32.mul
        (f32.load
         (get_local $var$2)
        )
        (get_local $var$8)
       )
      )
     )
     (br_if $label$32
      (tee_local $var$1
       (i32.load
        (get_local $var$1)
       )
      )
     )
    )
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.const 12)
       )
       (i32.shl
        (i32.mul
         (get_local $var$3)
         (get_local $var$6)
        )
        (i32.const 2)
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$8
   (f32.convert_u/i32
    (i32.load
     (get_local $var$7)
    )
   )
  )
  (set_local $var$3
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$0
   (get_local $var$1)
  )
  (loop $label$34
   (f32.store
    (tee_local $var$1
     (i32.add
      (get_local $var$0)
      (i32.const 12)
     )
    )
    (f32.add
     (f32.load
      (get_local $var$1)
     )
     (f32.mul
      (f32.load
       (get_local $var$3)
      )
      (get_local $var$8)
     )
    )
   )
   (br_if $label$34
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
  )
 )
 (func $21 (; 26 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 i32)
  (local $var$11 f32)
  (if
   (i32.le_u
    (i32.add
     (tee_local $var$2
      (i32.load
       (get_local $var$0)
      )
     )
     (i32.const -1)
    )
    (i32.const 1)
   )
   (return)
  )
  (set_local $var$9
   (i32.add
    (get_local $var$0)
    (i32.const 4)
   )
  )
  (set_local $var$10
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$5
   (i32.const 1)
  )
  (loop $label$2
   (if
    (tee_local $var$4
     (i32.load
      (tee_local $var$1
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (i32.mul
           (tee_local $var$8
            (i32.add
             (i32.load
              (get_local $var$9)
             )
             (i32.const -1)
            )
           )
           (get_local $var$2)
          )
          (get_local $var$5)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
    (block
     (set_local $var$2
      (get_local $var$1)
     )
     (loop $label$4
      (set_local $var$3
       (call $38
        (get_local $var$4)
        (get_local $var$4)
        (get_local $var$0)
       )
      )
      (set_local $var$1
       (i32.load
        (get_local $var$4)
       )
      )
      (if
       (get_local $var$3)
       (block
        (i32.store
         (get_local $var$2)
         (get_local $var$1)
        )
        (i32.store
         (get_local $var$4)
         (i32.load
          (get_local $var$3)
         )
        )
        (i32.store
         (get_local $var$3)
         (get_local $var$4)
        )
       )
       (set_local $var$2
        (get_local $var$4)
       )
      )
      (if
       (get_local $var$1)
       (block
        (set_local $var$4
         (get_local $var$1)
        )
        (br $label$4)
       )
      )
     )
     (set_local $var$3
      (i32.load
       (tee_local $var$2
        (i32.add
         (i32.add
          (get_local $var$0)
          (i32.const 12)
         )
         (i32.shl
          (i32.add
           (tee_local $var$4
            (i32.mul
             (tee_local $var$1
              (i32.load
               (get_local $var$0)
              )
             )
             (get_local $var$8)
            )
           )
           (get_local $var$5)
          )
          (i32.const 2)
         )
        )
       )
      )
     )
     (set_local $var$7
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.const 12)
       )
       (i32.shl
        (i32.add
         (get_local $var$4)
         (tee_local $var$4
          (i32.add
           (get_local $var$5)
           (i32.const 1)
          )
         )
        )
        (i32.const 2)
       )
      )
     )
     (if
      (get_local $var$3)
      (block
       (set_local $var$1
        (get_local $var$3)
       )
       (loop $label$9
        (set_local $var$3
         (i32.load
          (get_local $var$1)
         )
        )
        (if
         (tee_local $var$6
          (call $38
           (get_local $var$1)
           (get_local $var$7)
           (get_local $var$0)
          )
         )
         (block
          (i32.store
           (get_local $var$2)
           (get_local $var$3)
          )
          (i32.store
           (get_local $var$1)
           (i32.load
            (get_local $var$6)
           )
          )
          (i32.store
           (get_local $var$6)
           (get_local $var$1)
          )
         )
         (set_local $var$2
          (get_local $var$1)
         )
        )
        (if
         (get_local $var$3)
         (block
          (set_local $var$1
           (get_local $var$3)
          )
          (br $label$9)
         )
        )
       )
       (if
        (tee_local $var$1
         (i32.load
          (tee_local $var$3
           (i32.add
            (i32.add
             (get_local $var$0)
             (i32.const 12)
            )
            (i32.shl
             (i32.add
              (i32.mul
               (tee_local $var$2
                (i32.load
                 (get_local $var$0)
                )
               )
               (get_local $var$8)
              )
              (get_local $var$5)
             )
             (i32.const 2)
            )
           )
          )
         )
        )
        (block
         (set_local $var$11
          (f32.convert_u/i32
           (i32.load
            (get_local $var$9)
           )
          )
         )
         (set_local $var$2
          (get_local $var$1)
         )
         (loop $label$14
          (f32.store
           (tee_local $var$7
            (i32.add
             (get_local $var$2)
             (i32.const 12)
            )
           )
           (f32.sub
            (f32.load
             (get_local $var$7)
            )
            (f32.mul
             (f32.load
              (get_local $var$10)
             )
             (get_local $var$11)
            )
           )
          )
          (br_if $label$14
           (tee_local $var$2
            (i32.load
             (get_local $var$2)
            )
           )
          )
         )
         (set_local $var$7
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (get_local $var$4)
            (i32.const 2)
           )
          )
         )
         (set_local $var$2
          (get_local $var$3)
         )
         (loop $label$15
          (set_local $var$3
           (i32.load
            (get_local $var$1)
           )
          )
          (if
           (tee_local $var$6
            (call $38
             (get_local $var$1)
             (get_local $var$7)
             (get_local $var$0)
            )
           )
           (block
            (i32.store
             (get_local $var$2)
             (get_local $var$3)
            )
            (i32.store
             (get_local $var$1)
             (i32.load
              (get_local $var$6)
             )
            )
            (i32.store
             (get_local $var$6)
             (get_local $var$1)
            )
           )
           (set_local $var$2
            (get_local $var$1)
           )
          )
          (if
           (get_local $var$3)
           (block
            (set_local $var$1
             (get_local $var$3)
            )
            (br $label$15)
           )
          )
         )
         (set_local $var$7
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (get_local $var$5)
            (i32.const 2)
           )
          )
         )
         (if
          (tee_local $var$1
           (i32.load
            (tee_local $var$2
             (i32.add
              (i32.add
               (get_local $var$0)
               (i32.const 12)
              )
              (i32.shl
               (i32.add
                (i32.mul
                 (tee_local $var$3
                  (i32.load
                   (get_local $var$0)
                  )
                 )
                 (get_local $var$8)
                )
                (get_local $var$5)
               )
               (i32.const 2)
              )
             )
            )
           )
          )
          (block
           (loop $label$20
            (set_local $var$3
             (i32.load
              (get_local $var$1)
             )
            )
            (if
             (tee_local $var$6
              (call $38
               (get_local $var$1)
               (get_local $var$7)
               (get_local $var$0)
              )
             )
             (block
              (i32.store
               (get_local $var$2)
               (get_local $var$3)
              )
              (i32.store
               (get_local $var$1)
               (i32.load
                (get_local $var$6)
               )
              )
              (i32.store
               (get_local $var$6)
               (get_local $var$1)
              )
             )
             (set_local $var$2
              (get_local $var$1)
             )
            )
            (if
             (get_local $var$3)
             (block
              (set_local $var$1
               (get_local $var$3)
              )
              (br $label$20)
             )
            )
           )
           (set_local $var$7
            (i32.add
             (i32.add
              (get_local $var$0)
              (i32.shl
               (get_local $var$5)
               (i32.const 2)
              )
             )
             (i32.const 8)
            )
           )
           (if
            (tee_local $var$1
             (i32.load
              (tee_local $var$2
               (i32.add
                (i32.add
                 (get_local $var$0)
                 (i32.const 12)
                )
                (i32.shl
                 (i32.add
                  (i32.mul
                   (tee_local $var$3
                    (i32.load
                     (get_local $var$0)
                    )
                   )
                   (get_local $var$8)
                  )
                  (get_local $var$5)
                 )
                 (i32.const 2)
                )
               )
              )
             )
            )
            (block
             (loop $label$25
              (set_local $var$3
               (i32.load
                (get_local $var$1)
               )
              )
              (if
               (tee_local $var$6
                (call $38
                 (get_local $var$1)
                 (get_local $var$7)
                 (get_local $var$0)
                )
               )
               (block
                (i32.store
                 (get_local $var$2)
                 (get_local $var$3)
                )
                (i32.store
                 (get_local $var$1)
                 (i32.load
                  (get_local $var$6)
                 )
                )
                (i32.store
                 (get_local $var$6)
                 (get_local $var$1)
                )
               )
               (set_local $var$2
                (get_local $var$1)
               )
              )
              (if
               (get_local $var$3)
               (block
                (set_local $var$1
                 (get_local $var$3)
                )
                (br $label$25)
               )
              )
             )
             (if
              (tee_local $var$2
               (i32.load
                (i32.add
                 (i32.add
                  (get_local $var$0)
                  (i32.const 12)
                 )
                 (i32.shl
                  (i32.add
                   (i32.mul
                    (tee_local $var$1
                     (i32.load
                      (get_local $var$0)
                     )
                    )
                    (get_local $var$8)
                   )
                   (get_local $var$5)
                  )
                  (i32.const 2)
                 )
                )
               )
              )
              (block
               (set_local $var$11
                (f32.convert_u/i32
                 (i32.load
                  (get_local $var$9)
                 )
                )
               )
               (loop $label$30
                (f32.store
                 (tee_local $var$3
                  (i32.add
                   (get_local $var$2)
                   (i32.const 12)
                  )
                 )
                 (f32.add
                  (f32.load
                   (get_local $var$3)
                  )
                  (f32.mul
                   (f32.load
                    (get_local $var$10)
                   )
                   (get_local $var$11)
                  )
                 )
                )
                (br_if $label$30
                 (tee_local $var$2
                  (i32.load
                   (get_local $var$2)
                  )
                 )
                )
               )
               (set_local $var$2
                (get_local $var$1)
               )
              )
              (set_local $var$2
               (get_local $var$1)
              )
             )
            )
            (set_local $var$2
             (get_local $var$3)
            )
           )
          )
          (set_local $var$2
           (get_local $var$3)
          )
         )
        )
       )
      )
      (set_local $var$2
       (get_local $var$1)
      )
     )
    )
    (set_local $var$4
     (i32.add
      (get_local $var$5)
      (i32.const 1)
     )
    )
   )
   (if
    (i32.lt_u
     (get_local $var$4)
     (i32.add
      (get_local $var$2)
      (i32.const -1)
     )
    )
    (block
     (set_local $var$5
      (get_local $var$4)
     )
     (br $label$2)
    )
   )
  )
 )
 (func $22 (; 27 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 i32)
  (local $var$11 f32)
  (set_local $var$6
   (i32.add
    (tee_local $var$8
     (i32.load
      (get_local $var$0)
     )
    )
    (i32.const -1)
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (tee_local $var$2
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (i32.mul
           (get_local $var$8)
           (tee_local $var$7
            (i32.add
             (i32.load
              (tee_local $var$9
               (i32.add
                (get_local $var$0)
                (i32.const 4)
               )
              )
             )
             (i32.const -1)
            )
           )
          )
          (get_local $var$6)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
   )
   (return)
  )
  (loop $label$2
   (set_local $var$4
    (call $38
     (get_local $var$1)
     (get_local $var$1)
     (get_local $var$0)
    )
   )
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$4)
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$4)
      )
     )
     (i32.store
      (get_local $var$4)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$2)
    )
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (tee_local $var$3
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (tee_local $var$10
           (i32.mul
            (tee_local $var$2
             (i32.load
              (get_local $var$0)
             )
            )
            (get_local $var$7)
           )
          )
          (get_local $var$6)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$11
   (f32.convert_u/i32
    (get_local $var$2)
   )
  )
  (set_local $var$5
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$2
   (get_local $var$1)
  )
  (loop $label$7
   (f32.store
    (tee_local $var$4
     (i32.add
      (get_local $var$2)
      (i32.const 8)
     )
    )
    (f32.sub
     (f32.load
      (get_local $var$4)
     )
     (f32.mul
      (f32.load
       (get_local $var$5)
      )
      (get_local $var$11)
     )
    )
   )
   (br_if $label$7
    (tee_local $var$2
     (i32.load
      (get_local $var$2)
     )
    )
   )
  )
  (set_local $var$4
   (i32.add
    (i32.add
     (get_local $var$0)
     (i32.const 12)
    )
    (i32.shl
     (get_local $var$10)
     (i32.const 2)
    )
   )
  )
  (set_local $var$2
   (get_local $var$3)
  )
  (loop $label$8
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (tee_local $var$5
     (call $38
      (get_local $var$1)
      (get_local $var$4)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$5)
      )
     )
     (i32.store
      (get_local $var$5)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$8)
    )
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (tee_local $var$3
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (i32.mul
           (i32.load
            (get_local $var$0)
           )
           (get_local $var$7)
          )
          (get_local $var$6)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$11
   (f32.convert_u/i32
    (i32.load
     (get_local $var$9)
    )
   )
  )
  (set_local $var$5
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$2
   (get_local $var$1)
  )
  (loop $label$13
   (f32.store
    (tee_local $var$4
     (i32.add
      (get_local $var$2)
      (i32.const 12)
     )
    )
    (f32.sub
     (f32.load
      (get_local $var$4)
     )
     (f32.mul
      (f32.load
       (get_local $var$5)
      )
      (get_local $var$11)
     )
    )
   )
   (br_if $label$13
    (tee_local $var$2
     (i32.load
      (get_local $var$2)
     )
    )
   )
  )
  (set_local $var$4
   (i32.add
    (get_local $var$0)
    (i32.const 12)
   )
  )
  (set_local $var$2
   (get_local $var$3)
  )
  (loop $label$14
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (tee_local $var$5
     (call $38
      (get_local $var$1)
      (get_local $var$4)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$5)
      )
     )
     (i32.store
      (get_local $var$5)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$14)
    )
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (tee_local $var$3
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (i32.mul
           (tee_local $var$2
            (i32.load
             (get_local $var$0)
            )
           )
           (get_local $var$7)
          )
          (get_local $var$6)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$11
   (f32.convert_u/i32
    (get_local $var$2)
   )
  )
  (set_local $var$5
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$2
   (get_local $var$1)
  )
  (loop $label$19
   (f32.store
    (tee_local $var$4
     (i32.add
      (get_local $var$2)
      (i32.const 8)
     )
    )
    (f32.add
     (f32.load
      (get_local $var$4)
     )
     (f32.mul
      (f32.load
       (get_local $var$5)
      )
      (get_local $var$11)
     )
    )
   )
   (br_if $label$19
    (tee_local $var$2
     (i32.load
      (get_local $var$2)
     )
    )
   )
  )
  (set_local $var$4
   (i32.add
    (i32.add
     (get_local $var$0)
     (i32.const 12)
    )
    (i32.shl
     (get_local $var$6)
     (i32.const 2)
    )
   )
  )
  (set_local $var$2
   (get_local $var$3)
  )
  (loop $label$20
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (tee_local $var$5
     (call $38
      (get_local $var$1)
      (get_local $var$4)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$5)
      )
     )
     (i32.store
      (get_local $var$5)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$20)
    )
   )
  )
  (if
   (i32.eqz
    (tee_local $var$1
     (i32.load
      (tee_local $var$2
       (i32.add
        (i32.add
         (get_local $var$0)
         (i32.const 12)
        )
        (i32.shl
         (i32.add
          (i32.mul
           (i32.load
            (get_local $var$0)
           )
           (get_local $var$7)
          )
          (get_local $var$6)
         )
         (i32.const 2)
        )
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$4
   (i32.add
    (i32.add
     (get_local $var$0)
     (i32.shl
      (get_local $var$8)
      (i32.const 2)
     )
    )
    (i32.const 4)
   )
  )
  (loop $label$25
   (set_local $var$3
    (i32.load
     (get_local $var$1)
    )
   )
   (if
    (tee_local $var$5
     (call $38
      (get_local $var$1)
      (get_local $var$4)
      (get_local $var$0)
     )
    )
    (block
     (i32.store
      (get_local $var$2)
      (get_local $var$3)
     )
     (i32.store
      (get_local $var$1)
      (i32.load
       (get_local $var$5)
      )
     )
     (i32.store
      (get_local $var$5)
      (get_local $var$1)
     )
    )
    (set_local $var$2
     (get_local $var$1)
    )
   )
   (if
    (get_local $var$3)
    (block
     (set_local $var$1
      (get_local $var$3)
     )
     (br $label$25)
    )
   )
  )
  (if
   (i32.eqz
    (tee_local $var$2
     (i32.load
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.const 12)
       )
       (i32.shl
        (i32.add
         (i32.mul
          (i32.load
           (get_local $var$0)
          )
          (get_local $var$7)
         )
         (get_local $var$6)
        )
        (i32.const 2)
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$11
   (f32.convert_u/i32
    (i32.load
     (get_local $var$9)
    )
   )
  )
  (set_local $var$1
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$0
   (get_local $var$2)
  )
  (loop $label$30
   (f32.store
    (tee_local $var$2
     (i32.add
      (get_local $var$0)
      (i32.const 12)
     )
    )
    (f32.add
     (f32.load
      (get_local $var$2)
     )
     (f32.mul
      (f32.load
       (get_local $var$1)
      )
      (get_local $var$11)
     )
    )
   )
   (br_if $label$30
    (tee_local $var$0
     (i32.load
      (get_local $var$0)
     )
    )
   )
  )
 )
 (func $23 (; 28 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (if
   (i32.eqz
    (i32.mul
     (tee_local $var$1
      (i32.load
       (tee_local $var$5
        (i32.add
         (get_local $var$0)
         (i32.const 4)
        )
       )
      )
     )
     (tee_local $var$3
      (i32.load
       (get_local $var$0)
      )
     )
    )
   )
   (return)
  )
  (loop $label$2
   (if
    (tee_local $var$2
     (i32.load
      (i32.add
       (i32.add
        (get_local $var$0)
        (i32.const 12)
       )
       (i32.shl
        (get_local $var$4)
        (i32.const 2)
       )
      )
     )
    )
    (block
     (set_local $var$1
      (get_local $var$2)
     )
     (loop $label$4
      (i32.store
       (tee_local $var$2
        (i32.add
         (get_local $var$1)
         (i32.const 4)
        )
       )
       (i32.and
        (i32.load
         (get_local $var$2)
        )
        (i32.const -2)
       )
      )
      (br_if $label$4
       (tee_local $var$1
        (i32.load
         (get_local $var$1)
        )
       )
      )
     )
     (set_local $var$3
      (i32.load
       (get_local $var$0)
      )
     )
     (set_local $var$1
      (i32.load
       (get_local $var$5)
      )
     )
    )
   )
   (br_if $label$2
    (i32.lt_u
     (tee_local $var$4
      (i32.add
       (get_local $var$4)
       (i32.const 1)
      )
     )
     (i32.mul
      (get_local $var$1)
      (get_local $var$3)
     )
    )
   )
  )
 )
 (func $24 (; 29 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 i32)
  (local $var$11 i32)
  (local $var$12 i32)
  (local $var$13 f32)
  (local $var$14 f32)
  (local $var$15 f32)
  (if
   (i32.eqz
    (tee_local $var$2
     (i32.load
      (tee_local $var$10
       (i32.add
        (get_local $var$0)
        (i32.const 4)
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$11
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$3
   (tee_local $var$1
    (i32.load
     (get_local $var$0)
    )
   )
  )
  (loop $label$2
   (set_local $var$4
    (if (result i32)
     (get_local $var$1)
     (block (result i32)
      (set_local $var$4
       (i32.const 0)
      )
      (loop $label$4
       (set_local $var$1
        (if (result i32)
         (tee_local $var$2
          (i32.load
           (tee_local $var$1
            (i32.add
             (i32.add
              (get_local $var$0)
              (i32.const 12)
             )
             (i32.shl
              (i32.add
               (i32.mul
                (get_local $var$1)
                (get_local $var$6)
               )
               (get_local $var$4)
              )
              (i32.const 2)
             )
            )
           )
          )
         )
         (block (result i32)
          (set_local $var$3
           (get_local $var$1)
          )
          (set_local $var$1
           (get_local $var$2)
          )
          (loop $label$6
           (set_local $var$7
            (i32.load
             (get_local $var$1)
            )
           )
           (if
            (i32.eqz
             (i32.and
              (i32.load offset=4
               (get_local $var$1)
              )
              (i32.const 1)
             )
            )
            (block
             (set_local $var$13
              (f32.add
               (f32.load offset=16
                (get_local $var$1)
               )
               (f32.load
                (tee_local $var$2
                 (i32.add
                  (get_local $var$1)
                  (i32.const 8)
                 )
                )
               )
              )
             )
             (f32.store
              (get_local $var$2)
              (get_local $var$13)
             )
             (set_local $var$15
              (f32.add
               (f32.load offset=20
                (get_local $var$1)
               )
               (f32.load
                (tee_local $var$2
                 (i32.add
                  (get_local $var$1)
                  (i32.const 12)
                 )
                )
               )
              )
             )
             (f32.store
              (get_local $var$2)
              (get_local $var$15)
             )
             (if
              (i32.eqz
               (i32.and
                (i32.eq
                 (get_local $var$4)
                 (tee_local $var$2
                  (if (result i32)
                   (f32.ne
                    (tee_local $var$14
                     (f32.div
                      (get_local $var$13)
                      (tee_local $var$13
                       (f32.load
                        (get_local $var$11)
                       )
                      )
                     )
                    )
                    (get_local $var$14)
                   )
                   (i32.const -2147483648)
                   (if (result i32)
                    (f32.ge
                     (get_local $var$14)
                     (f32.const 2147483648)
                    )
                    (i32.const -2147483648)
                    (if (result i32)
                     (f32.le
                      (get_local $var$14)
                      (f32.const -2147483648)
                     )
                     (i32.const -2147483648)
                     (i32.trunc_s/f32
                      (get_local $var$14)
                     )
                    )
                   )
                  )
                 )
                )
                (i32.eq
                 (get_local $var$6)
                 (tee_local $var$8
                  (if (result i32)
                   (f32.ne
                    (tee_local $var$13
                     (f32.div
                      (get_local $var$15)
                      (get_local $var$13)
                     )
                    )
                    (get_local $var$13)
                   )
                   (i32.const -2147483648)
                   (if (result i32)
                    (f32.ge
                     (get_local $var$13)
                     (f32.const 2147483648)
                    )
                    (i32.const -2147483648)
                    (if (result i32)
                     (f32.le
                      (get_local $var$13)
                      (f32.const -2147483648)
                     )
                     (i32.const -2147483648)
                     (i32.trunc_s/f32
                      (get_local $var$13)
                     )
                    )
                   )
                  )
                 )
                )
               )
              )
              (block
               (set_local $var$5
                (i32.load
                 (get_local $var$0)
                )
               )
               (set_local $var$12
                (if (result i32)
                 (i32.lt_s
                  (get_local $var$2)
                  (i32.const 0)
                 )
                 (loop $label$22 (result i32)
                  (if (result i32)
                   (i32.lt_s
                    (tee_local $var$2
                     (i32.add
                      (get_local $var$2)
                      (get_local $var$5)
                     )
                    )
                    (i32.const 0)
                   )
                   (br $label$22)
                   (get_local $var$2)
                  )
                 )
                 (if (result i32)
                  (get_local $var$5)
                  (i32.rem_s
                   (get_local $var$2)
                   (get_local $var$5)
                  )
                  (i32.const 0)
                 )
                )
               )
               (set_local $var$9
                (i32.load
                 (get_local $var$10)
                )
               )
               (if
                (i32.lt_s
                 (get_local $var$8)
                 (i32.const 0)
                )
                (block
                 (set_local $var$2
                  (get_local $var$8)
                 )
                 (loop $label$29
                  (br_if $label$29
                   (i32.lt_s
                    (tee_local $var$2
                     (i32.add
                      (get_local $var$2)
                      (get_local $var$9)
                     )
                    )
                    (i32.const 0)
                   )
                  )
                 )
                )
                (set_local $var$2
                 (if (result i32)
                  (get_local $var$9)
                  (i32.rem_s
                   (get_local $var$8)
                   (get_local $var$9)
                  )
                  (i32.const 0)
                 )
                )
               )
               (call $37
                (get_local $var$1)
                (get_local $var$0)
               )
               (i32.store
                (get_local $var$3)
                (get_local $var$7)
               )
               (i32.store
                (get_local $var$1)
                (i32.load
                 (tee_local $var$2
                  (i32.add
                   (i32.add
                    (get_local $var$0)
                    (i32.const 12)
                   )
                   (i32.shl
                    (i32.add
                     (i32.mul
                      (get_local $var$2)
                      (get_local $var$5)
                     )
                     (get_local $var$12)
                    )
                    (i32.const 2)
                   )
                  )
                 )
                )
               )
               (i32.store
                (get_local $var$2)
                (get_local $var$1)
               )
               (i32.store
                (tee_local $var$1
                 (i32.add
                  (get_local $var$1)
                  (i32.const 4)
                 )
                )
                (i32.or
                 (i32.load
                  (get_local $var$1)
                 )
                 (i32.const 1)
                )
               )
               (set_local $var$1
                (get_local $var$3)
               )
              )
             )
            )
           )
           (if
            (get_local $var$7)
            (block
             (set_local $var$3
              (get_local $var$1)
             )
             (set_local $var$1
              (get_local $var$7)
             )
             (br $label$6)
            )
           )
          )
          (i32.load
           (get_local $var$0)
          )
         )
         (get_local $var$3)
        )
       )
       (if
        (i32.lt_u
         (tee_local $var$4
          (i32.add
           (get_local $var$4)
           (i32.const 1)
          )
         )
         (get_local $var$1)
        )
        (block
         (set_local $var$3
          (get_local $var$1)
         )
         (br $label$4)
        )
       )
      )
      (set_local $var$2
       (i32.load
        (get_local $var$10)
       )
      )
      (get_local $var$1)
     )
     (block (result i32)
      (set_local $var$1
       (get_local $var$3)
      )
      (i32.const 0)
     )
    )
   )
   (if
    (i32.lt_u
     (tee_local $var$6
      (i32.add
       (get_local $var$6)
       (i32.const 1)
      )
     )
     (get_local $var$2)
    )
    (block
     (set_local $var$3
      (get_local $var$1)
     )
     (set_local $var$1
      (get_local $var$4)
     )
     (br $label$2)
    )
   )
  )
 )
 (func $25 (; 30 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 f32)
  (local $var$9 f32)
  (if
   (i32.eqz
    (tee_local $var$4
     (i32.load
      (tee_local $var$5
       (i32.add
        (get_local $var$0)
        (i32.const 4)
       )
      )
     )
    )
   )
   (return)
  )
  (set_local $var$7
   (i32.add
    (get_local $var$0)
    (i32.const 8)
   )
  )
  (set_local $var$2
   (tee_local $var$1
    (i32.load
     (get_local $var$0)
    )
   )
  )
  (loop $label$2
   (set_local $var$1
    (if (result i32)
     (get_local $var$1)
     (block (result i32)
      (set_local $var$4
       (i32.const 0)
      )
      (loop $label$4
       (if
        (tee_local $var$1
         (i32.load
          (i32.add
           (i32.add
            (get_local $var$0)
            (i32.const 12)
           )
           (i32.shl
            (i32.add
             (i32.mul
              (get_local $var$1)
              (get_local $var$6)
             )
             (get_local $var$4)
            )
            (i32.const 2)
           )
          )
         )
        )
        (loop $label$6
         (set_local $var$9
          (f32.mul
           (tee_local $var$8
            (f32.load
             (get_local $var$7)
            )
           )
           (f32.convert_u/i32
            (get_local $var$2)
           )
          )
         )
         (set_local $var$8
          (f32.mul
           (get_local $var$8)
           (f32.convert_u/i32
            (i32.load
             (get_local $var$5)
            )
           )
          )
         )
         (f32.store
          (tee_local $var$2
           (i32.add
            (get_local $var$1)
            (i32.const 8)
           )
          )
          (f32.sub
           (f32.load
            (get_local $var$2)
           )
           (get_local $var$9)
          )
         )
         (f32.store
          (tee_local $var$3
           (i32.add
            (get_local $var$1)
            (i32.const 12)
           )
          )
          (f32.sub
           (f32.load
            (get_local $var$3)
           )
           (get_local $var$8)
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (f32.store
          (get_local $var$2)
          (f32.add
           (get_local $var$9)
           (f32.load
            (get_local $var$2)
           )
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (f32.store
          (get_local $var$2)
          (f32.add
           (get_local $var$9)
           (f32.load
            (get_local $var$2)
           )
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (f32.store
          (get_local $var$3)
          (f32.add
           (get_local $var$8)
           (f32.load
            (get_local $var$3)
           )
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (f32.store
          (get_local $var$3)
          (f32.add
           (get_local $var$8)
           (f32.load
            (get_local $var$3)
           )
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (f32.store
          (get_local $var$2)
          (f32.sub
           (f32.load
            (get_local $var$2)
           )
           (get_local $var$9)
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (f32.store
          (get_local $var$2)
          (f32.sub
           (f32.load
            (get_local $var$2)
           )
           (get_local $var$9)
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (f32.store
          (get_local $var$3)
          (f32.sub
           (f32.load
            (get_local $var$3)
           )
           (get_local $var$8)
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (f32.store
          (get_local $var$2)
          (f32.add
           (get_local $var$9)
           (f32.load
            (get_local $var$2)
           )
          )
         )
         (call $fimport$7
          (f64.promote/f32
           (f32.load offset=8
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load offset=12
            (get_local $var$1)
           )
          )
          (f64.promote/f32
           (f32.load
            (i32.load offset=4
             (get_local $var$1)
            )
           )
          )
         )
         (set_local $var$2
          (i32.load
           (get_local $var$0)
          )
         )
         (br_if $label$6
          (tee_local $var$1
           (i32.load
            (get_local $var$1)
           )
          )
         )
        )
       )
       (if
        (i32.lt_u
         (tee_local $var$4
          (i32.add
           (get_local $var$4)
           (i32.const 1)
          )
         )
         (get_local $var$2)
        )
        (block
         (set_local $var$1
          (get_local $var$2)
         )
         (br $label$4)
        )
       )
      )
      (set_local $var$4
       (i32.load
        (get_local $var$5)
       )
      )
      (get_local $var$2)
     )
     (i32.const 0)
    )
   )
   (br_if $label$2
    (i32.lt_u
     (tee_local $var$6
      (i32.add
       (get_local $var$6)
       (i32.const 1)
      )
     )
     (get_local $var$4)
    )
   )
  )
 )
 (func $26 (; 31 ;) (type $11) (param $var$0 i32) (param $var$1 i32) (param $var$2 f32) (param $var$3 f32)
  (local $var$4 i32)
  (local $var$5 i32)
  (f32.store
   (i32.add
    (get_global $gimport$2)
    (i32.const 5242896)
   )
   (f32.const 6.239999771118164)
  )
  (f32.store
   (i32.add
    (get_global $gimport$2)
    (i32.const 5242900)
   )
   (f32.const 38.93759536743164)
  )
  (set_local $var$4
   (call $4
    (i32.const 40)
    (i32.const 20)
    (f32.const 25)
   )
  )
  (i32.store
   (i32.add
    (get_global $gimport$2)
    (i32.const 5242908)
   )
   (get_local $var$4)
  )
  (i32.store
   (i32.add
    (get_global $gimport$2)
    (i32.const 5242912)
   )
   (get_local $var$1)
  )
  (if
   (i32.eqz
    (get_local $var$0)
   )
   (return)
  )
  (loop $label$2
   (i32.store
    (get_global $gimport$2)
    (i32.add
     (tee_local $var$1
      (i32.load
       (get_global $gimport$2)
      )
     )
     (i32.const 32)
    )
   )
   (i32.store offset=4
    (get_local $var$1)
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242896)
    )
   )
   (set_local $var$5
    (call $29)
   )
   (f32.store offset=8
    (get_local $var$1)
    (f32.convert_u/i32
     (if (result i32)
      (tee_local $var$4
       (if (result i32)
        (f32.ne
         (tee_local $var$2
          (f32.mul
           (f32.load offset=8
            (tee_local $var$4
             (i32.load
              (i32.add
               (get_global $gimport$2)
               (i32.const 5242908)
              )
             )
            )
           )
           (f32.convert_u/i32
            (i32.load
             (get_local $var$4)
            )
           )
          )
         )
         (get_local $var$2)
        )
        (i32.const 0)
        (if (result i32)
         (f32.ge
          (get_local $var$2)
          (f32.const 4294967296)
         )
         (i32.const 0)
         (if (result i32)
          (f32.le
           (get_local $var$2)
           (f32.const -1)
          )
          (i32.const 0)
          (i32.trunc_u/f32
           (get_local $var$2)
          )
         )
        )
       )
      )
      (i32.rem_u
       (get_local $var$5)
       (get_local $var$4)
      )
      (i32.const 0)
     )
    )
   )
   (set_local $var$5
    (call $29)
   )
   (f32.store offset=12
    (get_local $var$1)
    (f32.convert_u/i32
     (if (result i32)
      (tee_local $var$4
       (if (result i32)
        (f32.ne
         (tee_local $var$2
          (f32.mul
           (f32.load offset=8
            (tee_local $var$4
             (i32.load
              (i32.add
               (get_global $gimport$2)
               (i32.const 5242908)
              )
             )
            )
           )
           (f32.convert_u/i32
            (i32.load offset=4
             (get_local $var$4)
            )
           )
          )
         )
         (get_local $var$2)
        )
        (i32.const 0)
        (if (result i32)
         (f32.ge
          (get_local $var$2)
          (f32.const 4294967296)
         )
         (i32.const 0)
         (if (result i32)
          (f32.le
           (get_local $var$2)
           (f32.const -1)
          )
          (i32.const 0)
          (i32.trunc_u/f32
           (get_local $var$2)
          )
         )
        )
       )
      )
      (i32.rem_u
       (get_local $var$5)
       (get_local $var$4)
      )
      (i32.const 0)
     )
    )
   )
   (f32.store offset=16
    (get_local $var$1)
    (f32.demote/f64
     (f64.div
      (f64.add
       (f64.promote/f32
        (f32.convert_u/i32
         (i32.rem_u
          (call $29)
          (i32.const 2000)
         )
        )
       )
       (f64.const -1e3)
      )
      (f64.const 300)
     )
    )
   )
   (f32.store offset=20
    (get_local $var$1)
    (f32.demote/f64
     (f64.div
      (f64.add
       (f64.promote/f32
        (f32.convert_u/i32
         (i32.rem_u
          (call $29)
          (i32.const 2000)
         )
        )
       )
       (f64.const -1e3)
      )
      (f64.const 300)
     )
    )
   )
   (call $5
    (i32.load
     (i32.add
      (get_global $gimport$2)
      (i32.const 5242908)
     )
    )
    (get_local $var$1)
   )
   (call $fimport$7
    (f64.promote/f32
     (f32.load offset=8
      (get_local $var$1)
     )
    )
    (f64.promote/f32
     (f32.load offset=12
      (get_local $var$1)
     )
    )
    (f64.promote/f32
     (f32.load
      (i32.load offset=4
       (get_local $var$1)
      )
     )
    )
   )
   (br_if $label$2
    (tee_local $var$0
     (i32.add
      (get_local $var$0)
      (i32.const -1)
     )
    )
   )
  )
 )
 (func $27 (; 32 ;) (type $12)
  (call $14
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $15
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $16
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $17
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $18
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $19
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $20
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $21
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $22
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $24
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $23
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
  (call $25
   (i32.load
    (i32.add
     (get_global $gimport$2)
     (i32.const 5242908)
    )
   )
  )
 )
 (func $28 (; 33 ;) (type $0) (param $var$0 i32)
  (i32.store
   (i32.add
    (get_global $gimport$2)
    (i32.const 5242912)
   )
   (get_local $var$0)
  )
 )
 (func $29 (; 34 ;) (type $13) (result i32)
  (local $var$0 i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (i32.store
   (i32.add
    (get_global $gimport$2)
    (i32.const 5242912)
   )
   (tee_local $var$0
    (i32.xor
     (i32.or
      (i32.shl
       (tee_local $var$1
        (i32.xor
         (i32.add
          (i32.mul
           (tee_local $var$0
            (i32.load
             (i32.add
              (get_global $gimport$2)
              (i32.const 5242912)
             )
            )
           )
           (i32.const 31)
          )
          (i32.const -1)
         )
         (get_local $var$0)
        )
       )
       (i32.sub
        (i32.const 32)
        (tee_local $var$2
         (i32.and
          (get_local $var$0)
          (i32.const 31)
         )
        )
       )
      )
      (i32.shr_u
       (get_local $var$1)
       (get_local $var$2)
      )
     )
     (get_local $var$0)
    )
   )
  )
  (get_local $var$0)
 )
 (func $30 (; 35 ;) (type $14) (param $var$0 i32) (result i32)
  (local $var$1 i32)
  (local $var$2 i32)
  (i32.store
   (get_global $gimport$2)
   (i32.add
    (tee_local $var$1
     (i32.load
      (get_global $gimport$2)
     )
    )
    (i32.sub
     (tee_local $var$2
      (i32.add
       (get_local $var$0)
       (i32.const 3)
      )
     )
     (if (result i32)
      (get_local $var$0)
      (i32.rem_u
       (get_local $var$2)
       (get_local $var$0)
      )
      (i32.const 0)
     )
    )
   )
  )
  (get_local $var$1)
 )
 (func $31 (; 36 ;) (type $3) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32) (result i32)
  (if
   (i32.eqz
    (get_local $var$2)
   )
   (return
    (get_local $var$0)
   )
  )
  (set_local $var$1
   (i32.and
    (get_local $var$1)
    (i32.const 255)
   )
  )
  (loop $label$2
   (i32.store8
    (i32.add
     (get_local $var$0)
     (tee_local $var$2
      (i32.add
       (get_local $var$2)
       (i32.const -1)
      )
     )
    )
    (get_local $var$1)
   )
   (br_if $label$2
    (get_local $var$2)
   )
  )
  (get_local $var$0)
 )
 (func $32 (; 37 ;) (type $0) (param $var$0 i32)
  (call $fimport$7
   (f64.promote/f32
    (f32.load offset=8
     (get_local $var$0)
    )
   )
   (f64.promote/f32
    (f32.load offset=12
     (get_local $var$0)
    )
   )
   (f64.promote/f32
    (f32.load
     (i32.load offset=4
      (get_local $var$0)
     )
    )
   )
  )
 )
 (func $33 (; 38 ;) (type $15) (param $var$0 i32) (param $var$1 i32) (result f32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 f32)
  (local $var$9 f32)
  (local $var$10 f32)
  (local $var$11 f32)
  (local $var$12 f32)
  (local $var$13 f32)
  (local $var$14 f32)
  (set_local $var$2
   (get_global $global$0)
  )
  (set_global $global$0
   (i32.add
    (get_global $global$0)
    (i32.const 16)
   )
  )
  (set_local $var$8
   (f32.add
    (f32.load
     (i32.load
      (tee_local $var$4
       (i32.add
        (get_local $var$0)
        (i32.const 4)
       )
      )
     )
    )
    (f32.load
     (i32.load
      (tee_local $var$5
       (i32.add
        (get_local $var$1)
        (i32.const 4)
       )
      )
     )
    )
   )
  )
  (f32.store
   (get_local $var$2)
   (tee_local $var$12
    (f32.abs
     (f32.sub
      (tee_local $var$9
       (f32.load offset=8
        (get_local $var$0)
       )
      )
      (tee_local $var$11
       (f32.load offset=8
        (get_local $var$1)
       )
      )
     )
    )
   )
  )
  (f32.store offset=4
   (get_local $var$2)
   (tee_local $var$10
    (f32.abs
     (f32.sub
      (tee_local $var$13
       (f32.load offset=12
        (get_local $var$0)
       )
      )
      (tee_local $var$14
       (f32.load offset=12
        (get_local $var$1)
       )
      )
     )
    )
   )
  )
  (if
   (i32.eqz
    (i32.and
     (f32.le
      (get_local $var$12)
      (get_local $var$8)
     )
     (f32.lt
      (get_local $var$10)
      (get_local $var$8)
     )
    )
   )
   (block
    (set_global $global$0
     (get_local $var$2)
    )
    (return
     (f32.const -1)
    )
   )
  )
  (if
   (i32.eqz
    (f32.lt
     (tee_local $var$10
      (f32.sqrt
       (f32.add
        (f32.mul
         (tee_local $var$10
          (f32.load
           (get_local $var$2)
          )
         )
         (get_local $var$10)
        )
        (f32.mul
         (tee_local $var$10
          (f32.load offset=4
           (get_local $var$2)
          )
         )
         (get_local $var$10)
        )
       )
      )
     )
     (get_local $var$8)
    )
   )
   (block
    (set_global $global$0
     (get_local $var$2)
    )
    (return
     (f32.const -1)
    )
   )
  )
  (f32.store
   (tee_local $var$3
    (i32.add
     (get_local $var$2)
     (i32.const 8)
    )
   )
   (tee_local $var$8
    (f32.sub
     (get_local $var$11)
     (get_local $var$9)
    )
   )
  )
  (f32.store
   (tee_local $var$6
    (i32.add
     (get_local $var$3)
     (i32.const 4)
    )
   )
   (f32.sub
    (get_local $var$14)
    (get_local $var$13)
   )
  )
  (set_local $var$8
   (f32.neg
    (tee_local $var$9
     (f32.demote/f64
      (call $fimport$5
       (f64.promote/f32
        (f32.div
         (f32.abs
          (get_local $var$8)
         )
         (f32.sqrt
          (f32.add
           (f32.mul
            (tee_local $var$9
             (f32.load
              (get_local $var$3)
             )
            )
            (get_local $var$9)
           )
           (f32.mul
            (tee_local $var$9
             (f32.load offset=4
              (get_local $var$3)
             )
            )
            (get_local $var$9)
           )
          )
         )
        )
       )
      )
     )
    )
   )
  )
  (call $3
   (tee_local $var$7
    (i32.add
     (get_local $var$0)
     (i32.const 16)
    )
   )
   (if (result f32)
    (f32.lt
     (f32.mul
      (f32.load
       (get_local $var$3)
      )
      (f32.load
       (get_local $var$6)
      )
     )
     (f32.const 0)
    )
    (get_local $var$8)
    (tee_local $var$8
     (get_local $var$9)
    )
   )
  )
  (call $3
   (tee_local $var$3
    (i32.add
     (get_local $var$1)
     (i32.const 16)
    )
   )
   (get_local $var$8)
  )
  (set_local $var$13
   (f32.load
    (tee_local $var$0
     (i32.add
      (get_local $var$0)
      (i32.const 20)
     )
    )
   )
  )
  (set_local $var$9
   (f32.add
    (tee_local $var$11
     (f32.load offset=4
      (i32.load
       (get_local $var$4)
      )
     )
    )
    (tee_local $var$12
     (f32.load offset=4
      (i32.load
       (get_local $var$5)
      )
     )
    )
   )
  )
  (f32.store
   (get_local $var$0)
   (f32.add
    (f32.mul
     (get_local $var$13)
     (f32.div
      (f32.sub
       (get_local $var$11)
       (get_local $var$12)
      )
      (get_local $var$9)
     )
    )
    (f32.mul
     (tee_local $var$14
      (f32.load
       (tee_local $var$0
        (i32.add
         (get_local $var$1)
         (i32.const 20)
        )
       )
      )
     )
     (f32.div
      (f32.mul
       (get_local $var$12)
       (f32.const 2)
      )
      (get_local $var$9)
     )
    )
   )
  )
  (f32.store
   (get_local $var$0)
   (f32.add
    (f32.mul
     (get_local $var$13)
     (f32.div
      (f32.mul
       (get_local $var$11)
       (f32.const 2)
      )
      (get_local $var$9)
     )
    )
    (f32.mul
     (get_local $var$14)
     (f32.div
      (f32.sub
       (get_local $var$12)
       (get_local $var$11)
      )
      (get_local $var$9)
     )
    )
   )
  )
  (call $3
   (get_local $var$7)
   (tee_local $var$8
    (f32.neg
     (get_local $var$8)
    )
   )
  )
  (call $3
   (get_local $var$3)
   (get_local $var$8)
  )
  (set_global $global$0
   (get_local $var$2)
  )
  (get_local $var$10)
 )
 (func $34 (; 39 ;) (type $14) (param $var$0 i32) (result i32)
  (i32.ne
   (i32.and
    (i32.load offset=4
     (get_local $var$0)
    )
    (i32.const 1)
   )
   (i32.const 0)
  )
 )
 (func $35 (; 40 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (i32.store
   (tee_local $var$1
    (i32.add
     (get_local $var$0)
     (i32.const 4)
    )
   )
   (i32.or
    (i32.load
     (get_local $var$1)
    )
    (i32.const 1)
   )
  )
 )
 (func $36 (; 41 ;) (type $0) (param $var$0 i32)
  (local $var$1 i32)
  (i32.store
   (tee_local $var$1
    (i32.add
     (get_local $var$0)
     (i32.const 4)
    )
   )
   (i32.and
    (i32.load
     (get_local $var$1)
    )
    (i32.const -2)
   )
  )
 )
 (func $37 (; 42 ;) (type $7) (param $var$0 i32) (param $var$1 i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (local $var$4 f32)
  (local $var$5 f32)
  (set_local $var$5
   (f32.mul
    (f32.load
     (tee_local $var$2
      (i32.add
       (get_local $var$1)
       (i32.const 8)
      )
     )
    )
    (f32.convert_u/i32
     (i32.load
      (get_local $var$1)
     )
    )
   )
  )
  (if
   (f32.lt
    (tee_local $var$4
     (f32.load
      (tee_local $var$3
       (i32.add
        (get_local $var$0)
        (i32.const 8)
       )
      )
     )
    )
    (f32.const 0)
   )
   (loop $label$2
    (br_if $label$2
     (f32.lt
      (tee_local $var$4
       (f32.add
        (get_local $var$5)
        (get_local $var$4)
       )
      )
      (f32.const 0)
     )
    )
   )
   (if
    (f32.gt
     (get_local $var$4)
     (get_local $var$5)
    )
    (loop $label$5
     (br_if $label$5
      (f32.gt
       (tee_local $var$4
        (f32.sub
         (get_local $var$4)
         (get_local $var$5)
        )
       )
       (get_local $var$5)
      )
     )
    )
   )
  )
  (f32.store
   (get_local $var$3)
   (get_local $var$4)
  )
  (set_local $var$5
   (f32.mul
    (f32.load
     (get_local $var$2)
    )
    (f32.convert_u/i32
     (i32.load offset=4
      (get_local $var$1)
     )
    )
   )
  )
  (if
   (f32.lt
    (tee_local $var$4
     (f32.load
      (tee_local $var$0
       (i32.add
        (get_local $var$0)
        (i32.const 12)
       )
      )
     )
    )
    (f32.const 0)
   )
   (block
    (loop $label$7
     (br_if $label$7
      (f32.lt
       (tee_local $var$4
        (f32.add
         (get_local $var$5)
         (get_local $var$4)
        )
       )
       (f32.const 0)
      )
     )
    )
    (f32.store
     (get_local $var$0)
     (get_local $var$4)
    )
    (return)
   )
  )
  (if
   (i32.eqz
    (f32.gt
     (get_local $var$4)
     (get_local $var$5)
    )
   )
   (block
    (f32.store
     (get_local $var$0)
     (get_local $var$4)
    )
    (return)
   )
  )
  (loop $label$9
   (br_if $label$9
    (f32.gt
     (tee_local $var$4
      (f32.sub
       (get_local $var$4)
       (get_local $var$5)
      )
     )
     (get_local $var$5)
    )
   )
  )
  (f32.store
   (get_local $var$0)
   (get_local $var$4)
  )
 )
 (func $38 (; 43 ;) (type $3) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32) (result i32)
  (local $var$3 i32)
  (local $var$4 i32)
  (local $var$5 i32)
  (local $var$6 i32)
  (local $var$7 i32)
  (local $var$8 i32)
  (local $var$9 i32)
  (local $var$10 i32)
  (local $var$11 i32)
  (local $var$12 i32)
  (local $var$13 i32)
  (local $var$14 i32)
  (local $var$15 i32)
  (local $var$16 i32)
  (local $var$17 i32)
  (local $var$18 f32)
  (local $var$19 f32)
  (local $var$20 f32)
  (local $var$21 f32)
  (local $var$22 f32)
  (local $var$23 f32)
  (local $var$24 f32)
  (local $var$25 f32)
  (set_local $var$4
   (get_global $global$0)
  )
  (set_global $global$0
   (i32.add
    (get_global $global$0)
    (i32.const 16)
   )
  )
  (if
   (i32.and
    (i32.load
     (tee_local $var$15
      (i32.add
       (get_local $var$0)
       (i32.const 4)
      )
     )
    )
    (i32.const 1)
   )
   (block
    (set_global $global$0
     (get_local $var$4)
    )
    (return
     (i32.const 0)
    )
   )
  )
  (set_local $var$3
   (i32.load
    (get_local $var$1)
   )
  )
  (set_local $var$11
   (if (result i32)
    (f32.ne
     (tee_local $var$19
      (f32.div
       (f32.load
        (tee_local $var$6
         (i32.add
          (get_local $var$0)
          (i32.const 8)
         )
        )
       )
       (tee_local $var$18
        (f32.load
         (tee_local $var$5
          (i32.add
           (get_local $var$2)
           (i32.const 8)
          )
         )
        )
       )
      )
     )
     (get_local $var$19)
    )
    (i32.const -2147483648)
    (if (result i32)
     (f32.ge
      (get_local $var$19)
      (f32.const 2147483648)
     )
     (i32.const -2147483648)
     (if (result i32)
      (f32.le
       (get_local $var$19)
       (f32.const -2147483648)
      )
      (i32.const -2147483648)
      (i32.trunc_s/f32
       (get_local $var$19)
      )
     )
    )
   )
  )
  (set_local $var$12
   (if (result i32)
    (f32.ne
     (tee_local $var$18
      (f32.div
       (tee_local $var$19
        (f32.load
         (tee_local $var$7
          (i32.add
           (get_local $var$0)
           (i32.const 12)
          )
         )
        )
       )
       (get_local $var$18)
      )
     )
     (get_local $var$18)
    )
    (i32.const -2147483648)
    (if (result i32)
     (f32.ge
      (get_local $var$18)
      (f32.const 2147483648)
     )
     (i32.const -2147483648)
     (if (result i32)
      (f32.le
       (get_local $var$18)
       (f32.const -2147483648)
      )
      (i32.const -2147483648)
      (i32.trunc_s/f32
       (get_local $var$18)
      )
     )
    )
   )
  )
  (if
   (get_local $var$3)
   (block
    (set_local $var$13
     (i32.add
      (get_local $var$4)
      (i32.const 4)
     )
    )
    (set_local $var$16
     (i32.add
      (get_local $var$2)
      (i32.const 4)
     )
    )
    (set_local $var$14
     (get_local $var$1)
    )
    (set_local $var$1
     (get_local $var$3)
    )
    (loop $label$15
     (block $label$16
      (loop $label$17
       (if
        (i32.eqz
         (f32.lt
          (tee_local $var$21
           (call $33
            (get_local $var$0)
            (get_local $var$1)
           )
          )
          (f32.const 0)
         )
        )
        (block
         (set_local $var$22
          (f32.sub
           (f32.add
            (tee_local $var$23
             (f32.load
              (i32.load
               (get_local $var$15)
              )
             )
            )
            (tee_local $var$18
             (f32.load
              (i32.load offset=4
               (get_local $var$1)
              )
             )
            )
           )
           (get_local $var$21)
          )
         )
         (f32.store
          (get_local $var$4)
          (f32.sub
           (tee_local $var$24
            (f32.load
             (tee_local $var$9
              (i32.add
               (get_local $var$1)
               (i32.const 8)
              )
             )
            )
           )
           (tee_local $var$19
            (f32.load
             (get_local $var$6)
            )
           )
          )
         )
         (f32.store
          (get_local $var$13)
          (f32.sub
           (tee_local $var$25
            (f32.load
             (tee_local $var$10
              (i32.add
               (get_local $var$1)
               (i32.const 12)
              )
             )
            )
           )
           (tee_local $var$20
            (f32.load
             (get_local $var$7)
            )
           )
          )
         )
         (call $2
          (get_local $var$4)
         )
         (f32.store
          (get_local $var$6)
          (f32.sub
           (get_local $var$19)
           (f32.mul
            (tee_local $var$18
             (f32.div
              (f32.mul
               (get_local $var$18)
               (get_local $var$22)
              )
              (get_local $var$21)
             )
            )
            (tee_local $var$19
             (f32.load
              (get_local $var$4)
             )
            )
           )
          )
         )
         (f32.store
          (get_local $var$7)
          (f32.sub
           (get_local $var$20)
           (f32.mul
            (get_local $var$18)
            (tee_local $var$20
             (f32.load
              (get_local $var$13)
             )
            )
           )
          )
         )
         (f32.store
          (get_local $var$9)
          (tee_local $var$19
           (f32.add
            (get_local $var$24)
            (f32.mul
             (tee_local $var$18
              (f32.div
               (f32.mul
                (get_local $var$23)
                (get_local $var$22)
               )
               (get_local $var$21)
              )
             )
             (get_local $var$19)
            )
           )
          )
         )
         (f32.store
          (get_local $var$10)
          (tee_local $var$18
           (f32.add
            (get_local $var$25)
            (f32.mul
             (get_local $var$18)
             (get_local $var$20)
            )
           )
          )
         )
         (set_local $var$3
          (i32.load
           (get_local $var$1)
          )
         )
         (if
          (i32.eqz
           (i32.and
            (i32.eq
             (tee_local $var$17
              (if (result i32)
               (f32.ne
                (tee_local $var$20
                 (f32.div
                  (get_local $var$19)
                  (tee_local $var$19
                   (f32.load
                    (get_local $var$5)
                   )
                  )
                 )
                )
                (get_local $var$20)
               )
               (i32.const -2147483648)
               (if (result i32)
                (f32.ge
                 (get_local $var$20)
                 (f32.const 2147483648)
                )
                (i32.const -2147483648)
                (if (result i32)
                 (f32.le
                  (get_local $var$20)
                  (f32.const -2147483648)
                 )
                 (i32.const -2147483648)
                 (i32.trunc_s/f32
                  (get_local $var$20)
                 )
                )
               )
              )
             )
             (get_local $var$11)
            )
            (i32.eq
             (tee_local $var$8
              (if (result i32)
               (f32.ne
                (tee_local $var$18
                 (f32.div
                  (get_local $var$18)
                  (get_local $var$19)
                 )
                )
                (get_local $var$18)
               )
               (i32.const -2147483648)
               (if (result i32)
                (f32.ge
                 (get_local $var$18)
                 (f32.const 2147483648)
                )
                (i32.const -2147483648)
                (if (result i32)
                 (f32.le
                  (get_local $var$18)
                  (f32.const -2147483648)
                 )
                 (i32.const -2147483648)
                 (i32.trunc_s/f32
                  (get_local $var$18)
                 )
                )
               )
              )
             )
             (get_local $var$12)
            )
           )
          )
          (block
           (set_local $var$8
            (call $7
             (get_local $var$2)
             (get_local $var$17)
             (get_local $var$8)
            )
           )
           (set_local $var$18
            (f32.mul
             (f32.load
              (get_local $var$5)
             )
             (f32.convert_u/i32
              (i32.load
               (get_local $var$2)
              )
             )
            )
           )
           (if
            (f32.lt
             (tee_local $var$19
              (f32.load
               (get_local $var$9)
              )
             )
             (f32.const 0)
            )
            (loop $label$33
             (br_if $label$33
              (f32.lt
               (tee_local $var$19
                (f32.add
                 (get_local $var$18)
                 (get_local $var$19)
                )
               )
               (f32.const 0)
              )
             )
            )
            (if
             (f32.gt
              (get_local $var$19)
              (get_local $var$18)
             )
             (loop $label$36
              (br_if $label$36
               (f32.gt
                (tee_local $var$19
                 (f32.sub
                  (get_local $var$19)
                  (get_local $var$18)
                 )
                )
                (get_local $var$18)
               )
              )
             )
            )
           )
           (f32.store
            (get_local $var$9)
            (get_local $var$19)
           )
           (set_local $var$18
            (f32.mul
             (f32.load
              (get_local $var$5)
             )
             (f32.convert_u/i32
              (i32.load
               (get_local $var$16)
              )
             )
            )
           )
           (if
            (f32.lt
             (tee_local $var$19
              (f32.load
               (get_local $var$10)
              )
             )
             (f32.const 0)
            )
            (loop $label$38
             (br_if $label$38
              (f32.lt
               (tee_local $var$19
                (f32.add
                 (get_local $var$18)
                 (get_local $var$19)
                )
               )
               (f32.const 0)
              )
             )
            )
            (if
             (f32.gt
              (get_local $var$19)
              (get_local $var$18)
             )
             (loop $label$41
              (br_if $label$41
               (f32.gt
                (tee_local $var$19
                 (f32.sub
                  (get_local $var$19)
                  (get_local $var$18)
                 )
                )
                (get_local $var$18)
               )
              )
             )
            )
           )
           (f32.store
            (get_local $var$10)
            (get_local $var$19)
           )
           (i32.store
            (get_local $var$14)
            (get_local $var$3)
           )
           (i32.store
            (get_local $var$1)
            (i32.load
             (get_local $var$8)
            )
           )
           (i32.store
            (get_local $var$8)
            (get_local $var$1)
           )
          )
         )
         (br_if $label$16
          (i32.eqz
           (get_local $var$3)
          )
         )
         (set_local $var$1
          (get_local $var$3)
         )
         (br $label$17)
        )
       )
      )
      (if
       (tee_local $var$3
        (i32.load
         (get_local $var$1)
        )
       )
       (block
        (set_local $var$14
         (get_local $var$1)
        )
        (set_local $var$1
         (get_local $var$3)
        )
        (br $label$15)
       )
      )
     )
    )
    (set_local $var$19
     (f32.load
      (get_local $var$7)
     )
    )
   )
  )
  (if
   (i32.and
    (i32.eq
     (tee_local $var$1
      (if (result i32)
       (f32.ne
        (tee_local $var$21
         (f32.div
          (tee_local $var$18
           (f32.load
            (get_local $var$6)
           )
          )
          (tee_local $var$20
           (f32.load
            (get_local $var$5)
           )
          )
         )
        )
        (get_local $var$21)
       )
       (i32.const -2147483648)
       (if (result i32)
        (f32.ge
         (get_local $var$21)
         (f32.const 2147483648)
        )
        (i32.const -2147483648)
        (if (result i32)
         (f32.le
          (get_local $var$21)
          (f32.const -2147483648)
         )
         (i32.const -2147483648)
         (i32.trunc_s/f32
          (get_local $var$21)
         )
        )
       )
      )
     )
     (get_local $var$11)
    )
    (i32.eq
     (tee_local $var$0
      (if (result i32)
       (f32.ne
        (tee_local $var$21
         (f32.div
          (get_local $var$19)
          (get_local $var$20)
         )
        )
        (get_local $var$21)
       )
       (i32.const -2147483648)
       (if (result i32)
        (f32.ge
         (get_local $var$21)
         (f32.const 2147483648)
        )
        (i32.const -2147483648)
        (if (result i32)
         (f32.le
          (get_local $var$21)
          (f32.const -2147483648)
         )
         (i32.const -2147483648)
         (i32.trunc_s/f32
          (get_local $var$21)
         )
        )
       )
      )
     )
     (get_local $var$12)
    )
   )
   (block
    (set_global $global$0
     (get_local $var$4)
    )
    (return
     (i32.const 0)
    )
   )
  )
  (set_local $var$20
   (f32.mul
    (get_local $var$20)
    (f32.convert_u/i32
     (i32.load
      (get_local $var$2)
     )
    )
   )
  )
  (if
   (f32.lt
    (get_local $var$18)
    (f32.const 0)
   )
   (loop $label$57
    (br_if $label$57
     (f32.lt
      (tee_local $var$18
       (f32.add
        (get_local $var$20)
        (get_local $var$18)
       )
      )
      (f32.const 0)
     )
    )
   )
   (if
    (f32.gt
     (get_local $var$18)
     (get_local $var$20)
    )
    (loop $label$60
     (br_if $label$60
      (f32.gt
       (tee_local $var$18
        (f32.sub
         (get_local $var$18)
         (get_local $var$20)
        )
       )
       (get_local $var$20)
      )
     )
    )
   )
  )
  (f32.store
   (get_local $var$6)
   (get_local $var$18)
  )
  (set_local $var$18
   (f32.mul
    (f32.load
     (get_local $var$5)
    )
    (f32.convert_u/i32
     (i32.load offset=4
      (get_local $var$2)
     )
    )
   )
  )
  (if
   (f32.lt
    (get_local $var$19)
    (f32.const 0)
   )
   (loop $label$62
    (br_if $label$62
     (f32.lt
      (tee_local $var$19
       (f32.add
        (get_local $var$18)
        (get_local $var$19)
       )
      )
      (f32.const 0)
     )
    )
   )
   (if
    (f32.gt
     (get_local $var$19)
     (get_local $var$18)
    )
    (loop $label$65
     (br_if $label$65
      (f32.gt
       (tee_local $var$19
        (f32.sub
         (get_local $var$19)
         (get_local $var$18)
        )
       )
       (get_local $var$18)
      )
     )
    )
   )
  )
  (f32.store
   (get_local $var$7)
   (get_local $var$19)
  )
  (set_local $var$0
   (call $7
    (get_local $var$2)
    (get_local $var$1)
    (get_local $var$0)
   )
  )
  (set_global $global$0
   (get_local $var$4)
  )
  (get_local $var$0)
 )
 (func $39 (; 44 ;) (type $12)
  (nop)
 )
 (func $40 (; 45 ;) (type $12)
  (set_global $global$0
   (i32.add
    (get_global $gimport$2)
    (i32.const 16)
   )
  )
  (set_global $global$1
   (i32.add
    (get_global $global$0)
    (i32.const 5242880)
   )
  )
 )
 (func $41 (; 46 ;) (type $16) (result f64)
  (call $fimport$4
   (i32.const 0)
  )
  (f64.const 0)
 )
 (func $42 (; 47 ;) (type $17) (param $var$0 i32) (param $var$1 i32) (result f64)
  (f64.promote/f32
   (call $33
    (get_local $var$0)
    (get_local $var$1)
   )
  )
 )
 (func $43 (; 48 ;) (type $18) (param $var$0 i32) (param $var$1 i32) (param $var$2 f64) (param $var$3 f64)
  (call $26
   (get_local $var$0)
   (get_local $var$1)
   (f32.demote/f64
    (get_local $var$2)
   )
   (f32.demote/f64
    (get_local $var$3)
   )
  )
 )
 (func $44 (; 49 ;) (type $19) (param $var$0 i32) (result f64)
  (local $var$1 f32)
  (f64.promote/f32
   (f32.sqrt
    (f32.add
     (f32.mul
      (tee_local $var$1
       (f32.load
        (get_local $var$0)
       )
      )
      (get_local $var$1)
     )
     (f32.mul
      (tee_local $var$1
       (f32.load offset=4
        (get_local $var$0)
       )
      )
      (get_local $var$1)
     )
    )
   )
  )
 )
 (func $45 (; 50 ;) (type $20) (param $var$0 i32) (param $var$1 f64)
  (call $3
   (get_local $var$0)
   (f32.demote/f64
    (get_local $var$1)
   )
  )
 )
 (func $46 (; 51 ;) (type $21) (param $var$0 i32) (param $var$1 i32) (param $var$2 f64) (result i32)
  (call $4
   (get_local $var$0)
   (get_local $var$1)
   (f32.demote/f64
    (get_local $var$2)
   )
  )
 )
 ;; custom section "dylink", size 7
)

