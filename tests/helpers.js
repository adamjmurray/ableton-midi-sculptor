import { Note } from '../src';

export function makeNotes(...values) {
  return values.map(val =>
    new Note({ start: val, pitch: val, velocity: val, duration: val })
  );
}

export function cloneAll(cloneables) {
  return cloneables.map(c => c.clone());
}

