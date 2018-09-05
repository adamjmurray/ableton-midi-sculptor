import { Note } from '../src';

export function makeNotes(...values) {
  return values.map(val =>
    new Note({ start: val, pitch: val, velocity: val, duration: val })
  );
}

// "Map" notes by destructively modifying clones in a forEach
export function mapNotes(notes, map) {
  const mapped = cloneAll(notes);
  mapped.forEach(map);
  return mapped;
}

export function cloneAll(cloneables) {
  return cloneables.map(c => c.clone());
}
